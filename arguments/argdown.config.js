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
    // ea_proposals: {
    //   process: "export-svg",
    //   outputSuffix: ".ea_proposals",
    //   selection: {
    //     selectedSections: [
    //       "Exceptional Access",
    //       "Response Measures",
    //       "Arguments for Measures",
    //     ],
    //     selectedTags: ["ea-proposal", "neutral-ea"],
    //     selectElementsWithoutTag: true,
    //   },
    // },
    // pro: {
    //   process: "export-svg",
    //   outputSuffix: ".pro",
    //   selection: {
    //     selectedTags: ["ea-itself", "pro-ea"],
    //     selectElementsWithoutTag: true,
    //   },
    // },
    // anti: {
    //   process: "export-svg",
    //   outputSuffix: ".anti",
    //   selection: {
    //     selectedTags: ["ea-itself", "anti-ea"],
    //     selectElementsWithoutTag: true,
    //   },
    // },
    fallacies: {
      dot: {
        graphVizSettings: {
          rankdir: "LR",
        },
      },
      process: "export-svg",
      outputSuffix: ".fallacies",
      selection: {
        selectedSections: [
          "Central Issues",
          "Response Measures",
          "Exceptional Access",
          "Fallacies",
          "Fallacious Arguments",
        ],
        selectedTags: ["core", "ea-itself", "fallacy", "fallacious"],
        selectElementsWithoutTag: true,
      },
    },
    measures: {
      process: "export-svg",
      outputSuffix: ".measures",
      group: {
        groupDepth: 3,
      },
      selection: {
        selectedSections: [
          "Central Issues",
          "Response Measures",
          "Exceptional Access",
          "Legal Action",
          "Arguments for Measures",
        ],
      },
    },
  },
};
