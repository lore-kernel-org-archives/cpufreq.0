From: Pavel Machek <pavel@suse.cz>
Subject: Re: powernow-k8-acpi driver
Date: Wed, 3 Mar 2004 23:35:10 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040303223510.GE222@elf.ucw.cz>
References: <20040303215435.GA467@elf.ucw.cz> <20040303222712.GA16874@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040303222712.GA16874@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Cpufreq mailing list <cpufreq@www.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, davej@codemonkey.ork.uk
Cc: paul.devriendt@amd.com

On St 03-03-04 22:27:12, Dave Jones wrote:
> On Wed, Mar 03, 2004 at 10:54:36PM +0100, Pavel Machek wrote:
>  > Hi!
>  > 
>  > Lots of machines have broken PST tables, so current in-kernel driver
>  > refuses to works on them. Vendors do get ACPI tables right because
>  > apparently Windows use them ;-). So this driver tends to work.
>  > 
>  > Comments? Could we get this into mainline?
> 
> I really dislike the idea of having >1 driver for this.
> Why can't we have a "use_acpi" module_param to switch to this ?

Well, that would probably not even link on kernel without ACPI...

We could make that functionality depend on CONFIG_ACPI, and allow
runtime selection only if its defined... But those two drivers are
pretty different just now and acpi-dependend chunk is pretty big. (It
does funny stuff like polling for AC plug removal if we are in
high-power state  and battery would not handle that. Old driver simply
refused to use high-power states on such machines.)

								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
