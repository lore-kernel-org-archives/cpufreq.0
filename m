From: paul.devriendt@amd.com
Subject: RE: powernow-k8-acpi driver
Date: Wed, 3 Mar 2004 17:48:46 -0600
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <99F2150714F93F448942F9A9F112634C109A392F@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pavel@suse.cz, davej@redhat.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, davej@codemonkey.ork.uk

>> you're aware of Dominik/Bruno's work on the 'acpilib'[1] stuff in this 
>> area right ? We'll need that anyway for Powernow-k7 and maybe longhaul 
>> too and its senseless duplicating this code.
> 
> That [1] looks like promise of url, but I don't see that url.

No, I am not aware of this, and I think Dominik is out for a few days.
If there is some sort of library functionality I can use and eliminate
code in the powernow-k8 driver, I will glad make the change to use it.

Paul.
