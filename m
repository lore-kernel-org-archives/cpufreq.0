From: Pavel Machek <pavel@suse.cz>
Subject: Re: powernow-k8-acpi driver
Date: Thu, 4 Mar 2004 01:07:54 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040304000754.GK222@elf.ucw.cz>
References: <20040303215435.GA467@elf.ucw.cz> <20040303222712.GA16874@redhat.com> <20040303223510.GE222@elf.ucw.cz> <20040303224841.GB16874@redhat.com> <20040303225405.GF222@elf.ucw.cz> <20040303233603.GA18722@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040303233603.GA18722@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Cpufreq mailing list <cpufreq@www.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, davej@codemonkey.ork.uk, paul.devriendt@amd.com

Hi!

>  > >  > We could make that functionality depend on CONFIG_ACPI, and allow
>  > >  > runtime selection only if its defined... But those two drivers are
>  > >  > pretty different just now and acpi-dependend chunk is pretty big. (It
>  > >  > does funny stuff like polling for AC plug removal if we are in
>  > >  > high-power state  and battery would not handle that. Old driver simply
>  > >  > refused to use high-power states on such machines.)
>  > > 
>  > > you're aware of Dominik/Bruno's work on the 'acpilib'[1] stuff in this
>  > > area right ? We'll need that anyway for Powernow-k7 and maybe longhaul too
>  > > and its senseless duplicating this code.
>  > 
>  > That [1] looks like promise of url, but I don't see that url.
> 
> Hmm, cpufreq mailing list archives are your best bet.
> What I meant to add was..

Ahha. Unfortunately, cpufreq mailing lists are only available to list
subscribers. Ouch.

								Pavel

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
