// no react or anything
let state = {};

// state management
function updateState(newState) {
	state = { ...state, ...newState };
	console.log(state);
}

// event handlers
$("#fileUpload").change(function(e) {
	let files = $("#fileUpload")[0].files;
	let filesArr = Array.from(files);
	updateState({ files: files, filesArr: filesArr });
	renderFileList();
});

$(".files").on("click", "li > i", function(e) {
	let key = $(this)
		.parent()
		.attr("key");
	let curArr = state.filesArr;
	curArr.splice(key, 1);
	updateState({ filesArr: curArr });
	renderFileList();
});

$(document).on("#UploadFiles", function(e) {
	e.preventDefault();
	console.log(state);
	renderFileList();
});

// render functions
function renderFileList() {
	let fileMap = state.filesArr.map((file, index) => {
		let suffix = "bytes";
		let size = file.size;
		if (size >= 1024 && size < 1024000) {
			suffix = "KB";
			size = Math.round(size / 1024 * 100) / 100;
		} else if (size >= 1024000) {
			suffix = "MB";
			size = Math.round(size / 1024000 * 100) / 100;
		}

		return `<li key="${index}">${
			file.name
		} <span class="file-size">${size} ${suffix}</span><i class="material-icons md-48">delete</i></li>`;
	});
	$("#FileList").html(fileMap);
}
