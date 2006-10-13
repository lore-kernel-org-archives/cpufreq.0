From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Strange entries in /proc/acpi/thermal_zone for Thinkpad X60
Date: Fri, 13 Oct 2006 14:44:57 +0000
Message-ID: <20061013144457.GA5512@ucw.cz>
References: <452EBF7C.3000409@goop.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750948AbWJMOpM@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <452EBF7C.3000409@goop.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: "Brown, Len" <len.brown@intel.com>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, acpi-devel@kernel.org, cpufreq@lists.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi!

> I have a Thinkpad X60 with an Intel Core Duo T2400.  In 
> /proc/acpi/thermal_zone, I'm getting two subdirectories, 
> each with their own set of files:

Looks okay to me. One thermal zone is cpu temperature, and second is
temperature of something else.

> The interesting thing is that the two sets of files are 
> not consistent - sometimes they don't even show the same 
> temperature.

You have two (actually you have more, see tp_smapi) physical
thermometers.

> The reason I'm interested in this is that I think it's 
> behind some of my cpufreq problems.  Sometimes the 
> kernel decides that I just can't raise the max frequency 
> above 1GHz, because its been thermally limited (I've put 
> printks in to confirm that its the ACPI thermal limit on 
> the policy notifier chain which is limiting the max 
> speed).  It seems to me that having a thermal zone for 
> each core is a BIOS bug, since they're really the same 
> chip, but the THM1 entries should be ignored.  I don't 

THM1 does not seem to be cpu temperature.

							Pavel
-- 
Thanks for all the (sleeping) penguins.
