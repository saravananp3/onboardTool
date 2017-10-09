/*
  Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.

  The MySQL Connector/J is licensed under the terms of the GPLv2
  <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>, like most MySQL Connectors.
  There are special exceptions to the terms and conditions of the GPLv2 as it is applied to
  this software, see the FOSS License Exception
  <http://www.mysql.com/about/legal/licensing/foss-exception.html>.

  This program is free software; you can redistribute it and/or modify it under the terms
  of the GNU General Public License as published by the Free Software Foundation; version 2
  of the License.

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along with this
  program; if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth
  Floor, Boston, MA 02110-1301  USA

 */

package com.mysql.cj.mysqla.io;

import java.io.IOException;
import java.util.Optional;

import com.mysql.cj.api.conf.PropertySet;
import com.mysql.cj.api.conf.ReadableProperty;
import com.mysql.cj.api.mysqla.io.PacketHeader;
import com.mysql.cj.api.mysqla.io.PacketPayload;
import com.mysql.cj.api.mysqla.io.ProtocolEntityFactory;
import com.mysql.cj.api.mysqla.io.ProtocolEntityReader;
import com.mysql.cj.api.mysqla.result.ResultsetRow;
import com.mysql.cj.core.conf.PropertyDefinitions;

public class ResultsetRowReader implements ProtocolEntityReader<ResultsetRow> {

    protected MysqlaProtocol protocol;

    protected PropertySet propertySet;

    protected ReadableProperty<Integer> useBufferRowSizeThreshold;

    public ResultsetRowReader(MysqlaProtocol prot) {
        this.protocol = prot;

        this.propertySet = this.protocol.getPropertySet();
        this.useBufferRowSizeThreshold = this.propertySet.getMemorySizeReadableProperty(PropertyDefinitions.PNAME_largeRowSizeThreshold);
    }

    /**
     * Retrieve one row from the MySQL server. Note: this method is not
     * thread-safe, but it is only called from methods that are guarded by
     * synchronizing on this object.
     * 
     * @param sf
     * @throws IOException
     * 
     */
    @Override
    public ResultsetRow read(ProtocolEntityFactory<ResultsetRow> sf) throws IOException {
        AbstractRowFactory rf = (AbstractRowFactory) sf;
        PacketPayload rowPacket = null;
        PacketHeader hdr = this.protocol.getPacketReader().readHeader();
        int packetLength = hdr.getPacketLength();

        // read the entire packet(s)
        rowPacket = this.protocol.getPacketReader()
                .readPayload(rf.canReuseRowPacketForBufferRow() ? Optional.ofNullable(this.protocol.getReusablePacket()) : Optional.empty(), packetLength);
        this.protocol.checkErrorPacket(rowPacket);
        // Didn't read an error, so re-position to beginning of packet in order to read result set data
        rowPacket.setPosition(rowPacket.getPosition() - 1);

        // exit early with null if there's an EOF packet
        if (!this.protocol.getServerSession().isEOFDeprecated() && rowPacket.isEOFPacket()
                || this.protocol.getServerSession().isEOFDeprecated() && rowPacket.isResultSetOKPacket()) {
            this.protocol.readServerStatusForResultSets(rowPacket, true);
            return null;
        }

        return sf.createFromPacketPayload(rowPacket);
    }

}
