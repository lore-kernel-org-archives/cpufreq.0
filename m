From: Len Brown <lenb@kernel.org>
Subject: Re: [PATCH 2/5] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Tue, 02 Aug 2011 16:21:16 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1108021618190.25237@x980>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
 <1305651819-25660-2-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <1305651819-25660-2-git-send-email-mjg@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org

While this patch will work and is not invalid, I don't like it.

It advertises a user I/F that suggests that disabling turbo
is on a per logical processor basis -- but a write to
any of the attributes will write to every CPU in the system.

Either it should do per-cpu limiting (which, btw doesn't
work if you use the MISC_ENABLES MSR method in this patch,
and would instead need to use the PERF_CTL.32 method)
or there should be a per-system attribute
that reflects that this knob is per-system.

thanks,
Len Brown, Intel Open Source Technology Center

