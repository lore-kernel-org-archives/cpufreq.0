From: Thomas Renninger <trenn@suse.de>
Subject: cpupowerutils: easier use of msr and cpuid stuff and some more
Date: Tue,  5 Oct 2010 14:23:09 +0200
Message-ID: <1286281394-14699-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

Compile tested on x86_64.
The new param got quickly tested, but not in all variants on all HW.

For not X86, msr.h and cpuid.h needs some dummy functions if:
#if defined(__i386__) || defined(__x86_64__)
is not defined. I can send this on top, but like to get some feedback on
this first.

It would be great if this can be pushed if there aren't sever errors
or whatever issues.

Thanks,

      Thomas

