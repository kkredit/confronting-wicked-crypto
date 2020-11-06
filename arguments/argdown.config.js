// See https://argdown.org/guide/configuration-cheatsheet.html

module.exports = {
  author: "Kevin Kredit",
  inputPath: "./build/w_citations/comprehensive.ad",
  model: {
    mode: "strict",
    removeTagsFromText: true,
  },
  svg: {
    outputDir: "./build",
  },
  processes: {
    file: {
      inputPath: process.argv[process.argv.length - 1],
      process: "export-svg",
    },
    whole: {
      process: "export-svg",
      outputSuffix: ".whole",
    },
    contrib: {
      process: "export-svg",
      outputSuffix: ".contrib",
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Central Issues",
          "Response Measures",
          "Arguments for Exceptional Access",
          "Exceptional Access",
        ],
      },
    },
    goingdark: {
      process: "export-svg",
      outputSuffix: ".goingdark",
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Exceptional Access",
          "Central Issues",
          "Going Dark Conclusions",
          "Going Dark Argument",
          "Going Dark Non Core",
        ],
      },
    },
    goldenage: {
      process: "export-svg",
      outputSuffix: ".goldenage",
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Exceptional Access",
          "Central Issues",
          "Going Dark Conclusions",
          "Golden Age Argument",
          "Golden Age Non Core",
        ],
      },
      dot: {
        argument: { lineWidth: 125 },
        statement: { lineWidth: 125 },
      },
    },
    fallacies: {
      process: "export-svg",
      outputSuffix: ".fallacies",
      dot: {
        graphVizSettings: {
          rankdir: "LR",
        },
      },
      selection: {
        selectedSections: [
          "Exceptional Access",
          "Fallacies",
          "Fallacious Arguments",
        ],
      },
    },
    measures: {
      process: "export-svg",
      outputSuffix: ".measures",
      dot: {
        graphVizSettings: {
          ranksep: 0.7,
        },
      },
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Central Issues",
          "Desireable Properties",
          "Response Measures",
          "Exceptional Access",
          "Current Capabilities",
          "Legal Measures",
          "Arguments for Measures",
        ],
      },
    },
    classes: {
      process: "export-svg",
      outputSuffix: ".classes",
      dot: {
        graphVizSettings: {
          ranksep: 0.7,
        },
      },
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Central Issues",
          "Desireable Properties",
          "Exceptional Access",
          "DAR EA Classes",
          "DIM EA Classes",
          "Arguments for EA Types",
        ],
        excludeStatements: [
          "Exceptional Access",
        ],
      },
    },
    // proposals: {
    //   process: "export-svg",
    //   outputSuffix: ".proposals",
    //   group: {
    //     groupDepth: 3,
    //   },
    //   selection: {
    //     selectedSections: [
    //       "Central Issues",
    //       "Exceptional Access",
    //       "DAR EA Proposals",
    //       "DIM EA Proposals",
    //       "Arguments for EA Proposals",
    //     ],
    //   },
    // },
  },
};
