From: Pavel Machek <pavel@suse.cz>
Subject: Re: powernow-k8-acpi driver
Date: Thu, 4 Mar 2004 00:45:53 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040303234553.GJ222@elf.ucw.cz>
References: <20040303215435.GA467@elf.ucw.cz> <20040303222712.GA16874@redhat.com> <20040303223510.GE222@elf.ucw.cz> <20040303224841.GB16874@redhat.com> <20040303231143.GH222@elf.ucw.cz> <20040303233939.GB18722@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040303233939.GB18722@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Cpufreq mailing list <cpufreq@www.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, paul.devriendt@amd.com

Hi!

>  > Dave, could you apply these? That are cleanups from Paul's new version
>  > of driver (killed few unused defines, right names for MSR's
>  > (hopefully!), more linux-like comments). No code changes.
> 
> Looks trivial enough. I just bounced it forward to Linus directly.
> (I'm travelling this week, and bitkeeper on a laptop is unfunny)

:-)

>  > - *   (c) 2003 Advanced Micro Devices, Inc.
>  > + *   (c) 2003, 2004 Advanced Micro Devices, Inc.
>  >   *  Your use of this code is subject to the terms and conditions of the
>  > - *  GNU general public license version 2. See "../../../COPYING" or
>  > + *  GNU general public license version 2. See "../../../../../COPYING" or
>  >   *  http://www.gnu.org/licenses/gpl.html
>  >   */
> 
> This bit seems really silly though, but thats just my opinion 8-)
> I'd just kill the ../'s completely.

Agreed, I assume AMD lawyers wanted that... If not, perhaps we can
make it disappear.
								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
