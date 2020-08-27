// See https://argdown.org/guide/configuration-cheatsheet.html

module.exports = {
  author: 'Kevin Kredit',
  inputPath: './build/w_citations/comprehensive.ad',
  model: {
    mode: 'strict',
    removeTagsFromText: true
  },
  svg: {
    outputDir: './build'
  },
  processes: {
    file: {
      inputPath: process.argv[process.argv.length - 1],
      process: 'export-svg'
    },
    whole: {
      process: 'export-svg',
      outputSuffix: ".whole"
    },
    ea_proposals: {
      process: 'export-svg',
      outputSuffix: ".ea_proposals",
      selection: {
        selectedTags: ['ea-proposal', 'neutral-ea'],
        selectElementsWithoutTag: true
      }
    },
    pro: {
      process: 'export-svg',
      outputSuffix: ".pro",
      selection: {
        selectedTags: ['ea-itself', 'pro-ea'],
        selectElementsWithoutTag: true,
      }
    },
    anti: {
      process: 'export-svg',
      outputSuffix: ".anti",
      selection: {
        selectedTags: ['ea-itself', 'anti-ea'],
        selectElementsWithoutTag: true,
      }
    },
    fallacies: {
      process: 'export-svg',
      outputSuffix: ".fallacies",
      selection: {
        selectedSections: [
          'Central Issues', 'Response Measures', 'Exceptional Access', 'Fallacies', 'Fallacious Arguments'
        ],
        selectedTags: ['core', 'ea-itself', 'fallacy', 'fallacious'],
        selectElementsWithoutTag: true
      }
    }
  }
};
