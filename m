From: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Subject: Re: Suspend to RAM regression tracked down
Date: Sun, 09 Jul 2006 15:28:15 +1000
Message-ID: <1152422895.14453.32.camel@idefix.homelinux.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org> <1152271537.5163.4.camel@idefix.homelinux.org>
	 <20060707162152.GB3223@redhat.com>
	 <1152312530.14453.16.camel@idefix.homelinux.org>
	 <20060708062345.GB3356@redhat.com>
	 <1152399303.14453.29.camel@idefix.homelinux.org>
	 <20060709032103.GA31395@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964995AbWGIF2S@vger.kernel.org>
In-Reply-To: <20060709032103.GA31395@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

> Actually, before deep diving into chasing bugs in ondemand, we should
> probably confirm that the same behaviour doesn't happen with a different
> governor.  Can you try that ?   Try setting it to userspace, and then
> running a userspace app like cpuspeed/powernowd etc.

Well, that's the thing here. I tried userspace and couldn't get it to
crash (for several weeks in a row). However, someone I know with the
same laptop model (not sure it's the exact same revision) told me it
would crash on him with userspace as well.

	Jean-Marc
