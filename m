From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH v4 3/7] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Sun, 24 Jul 2011 04:33:13 +0100
Message-ID: <20110724033313.GB25722@srcf.ucam.org>
References: <1311007062-2050-1-git-send-email-mjg@redhat.com>
 <1311007062-2050-4-git-send-email-mjg@redhat.com>
 <4E2B8E36.6030308@mit.edu>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E2B8E36.6030308@mit.edu>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Lutomirski <luto@mit.edu>
Cc: cpufreq@vger.kernel.org, davej@redhat.com, linux-kernel@vger.kernel.org, borislav.petkov@amd.com, mark.langsdorf@amd.com, andreas.herrmann3@amd.com

On Sat, Jul 23, 2011 at 11:15:02PM -0400, Andy Lutomirski wrote:

> I was curious and looked it up.  Intel SDM volume 3, 14.3.2.1 says:
> 
> Opportunistic processor performance operation can be disabled by
> setting bit 38 of
> IA32_MISC_ENABLE. This mechanism is intended for BIOS only. If
> IA32_MISC_ENABLE[38] is set, CPUID.06H:EAX[1] will return 0.

Hm. Interesting. The observed behaviour is that it works fine if we 
toggle this ourselves, and I don't remember the version of the docs I 
was looking at adding the BIOS proviso. Having said that...

> System software can temporarily disengage opportunistic processor
> performance
> operation by setting bit 32 of the IA32_PERF_CTL MSR (0199H), using a read-
> modify-write sequence on the MSR.

This complicates things a little, since right now we just write the 
firmware's P state value directly into PERF_CTL. We'd need to add code 
to acpi_cpufreq_target to make sure that it masked that bit off. It's a 
little more awkward, but if we're being told not to do it by just 
hitting the bit in MISC_ENABLE it's probably worth it. I'll try to 
handle that this week.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
