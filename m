From: Thomas Renninger <trenn@suse.de>
Subject: cpupower x86: AMD: Add fam12h HW Package C-state support
Date: Tue, 11 Oct 2011 15:33:49 +0200
Message-ID: <1318340031-52368-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, herrmann.der.user@googlemail.com

Forgot this one for a while, the manpage already talks about fam12h.
I adjusted the monitor names to Fam_12h and Fam14h.
It came out that there are quite some names for fam12h and 14h models
and that real CPU names should be avoided as monitor names.

Based on a recent Linus tree master branch.
Would be great if this can be scheduled for 3.2.

Thanks,

   Thomas


