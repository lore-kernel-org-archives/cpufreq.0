From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8-acpi driver
Date: Wed, 3 Mar 2004 22:27:12 +0000
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040303222712.GA16874@redhat.com>
References: <20040303215435.GA467@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040303215435.GA467@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Cpufreq mailing list <cpufreq@www.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, davej@codemonkey.ork.uk

On Wed, Mar 03, 2004 at 10:54:36PM +0100, Pavel Machek wrote:
 > Hi!
 > 
 > Lots of machines have broken PST tables, so current in-kernel driver
 > refuses to works on them. Vendors do get ACPI tables right because
 > apparently Windows use them ;-). So this driver tends to work.
 > 
 > Comments? Could we get this into mainline?

I really dislike the idea of having >1 driver for this.
Why can't we have a "use_acpi" module_param to switch to this ?

		Dave
