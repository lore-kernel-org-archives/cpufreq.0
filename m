From: Pavel Machek <pavel@suse.cz>
Subject: Re: powernow-k8-acpi driver
Date: Thu, 4 Mar 2004 00:26:09 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040303232609.GI222@elf.ucw.cz>
References: <20040303215435.GA467@elf.ucw.cz> <20040303222712.GA16874@redhat.com> <20040303223510.GE222@elf.ucw.cz> <20040303224841.GB16874@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040303224841.GB16874@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Cpufreq mailing list <cpufreq@www.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, davej@codemonkey.ork.uk, paul.devriendt@amd.com

Hi!

>  > We could make that functionality depend on CONFIG_ACPI, and allow
>  > runtime selection only if its defined... But those two drivers are
>  > pretty different just now and acpi-dependend chunk is pretty big. (It
>  > does funny stuff like polling for AC plug removal if we are in
>  > high-power state  and battery would not handle that. Old driver simply
>  > refused to use high-power states on such machines.)
> 
> you're aware of Dominik/Bruno's work on the 'acpilib'[1] stuff in this
> area right ? We'll need that anyway for Powernow-k7 and maybe longhaul too
> and its senseless duplicating this code.
> 
> One thing is bugging me though. Whats wrong with the ACPI P-state cpufreq
> driver ? Does that not work these days ? It's been a long time since I
> even looked at it.

One more thing: is there any reason for "use-array-as-struct"?

static int query_current_values_with_pending_wait(u8 *perproc)
{
...
        perproc[PP_OFF_CVID] = hi & MSR_S_HI_CURRENT_VID;
        perproc[PP_OFF_CFID] = lo & MSR_S_LO_CURRENT_FID;
}

having 

struct cpu_power {
	int numps, share, cvid, cfid;
	char pstates[0];
}

should do the trick...
							Pavel

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
