From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH]gx-suspmod.c use boot_cpu_data instead of
 current_cpu_data
Date: Thu, 26 Jul 2007 18:11:53 +0100
Message-ID: <20070726181153.17f83e21@the-village.bc.nu>
References: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
	<20070724234045.2cec5525.akpm@linux-foundation.org>
	<a8e1da0707252120l5e9e441bm53e2ba25bc9c20f0@mail.gmail.com>
	<20070725212638.79bc3945.akpm@linux-foundation.org>
	<20070726164654.GC32159@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1764841AbXGZRF2@vger.kernel.org>
In-Reply-To: <20070726164654.GC32159@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dave Young <hidave.darkstar@gmail.com>, linux-kernel@vger.kernel.org, Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk

O> a non-identical CPU system with a geode + something else doesn't exist
> and is very unlikely to happen.

As the Geode isn't used SMP (and afaik isnt SMP capable) that would be a
reasonable assumption
