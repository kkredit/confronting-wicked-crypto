// See https://argdown.org/guide/configuration-cheatsheet.html

module.exports = {
  author: 'Kevin Kredit',
  inputPath: './build/w_citations/*.argdown',
  model: {
    mode: 'loose',
    removeTagsFromText: true
  },
  selection: {
    excludeDisconnected: false
  },
  svg: {
    outputDir: './build'
  },
  processes: {
    svgs: {
      process: 'export-svg'
    },
    onesvg: {
      inputPath: process.argv[process.argv.length - 1],
      process: 'export-svg'
    }
  }
};
