From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH v4] Move modern AMD cpufreq support to acpi-cpufreq
Date: Mon, 18 Jul 2011 12:37:35 -0400
Message-ID: <1311007062-2050-1-git-send-email-mjg@redhat.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: davej@redhat.com, linux-kernel@vger.kernel.org, borislav.petkov@amd.com, mark.langsdorf@amd.com, andreas.herrmann3@amd.com

The programming model for cpufreq on current AMD CPUs is almost identical
to the one used on Intel and VIA hardware. This patchset merges support
into acpi-cpufreq and removes it from powernow-k8. V4 addresses all the 
review feedback received so far.

