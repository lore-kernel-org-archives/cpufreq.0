From: Dave Jones <davej@redhat.com>
Subject: Re: Suspend to RAM regression tracked down
Date: Sat, 8 Jul 2006 23:21:03 -0400
Message-ID: <20060709032103.GA31395@redhat.com>
References: <1151837268.5358.10.camel@idefix.homelinux.org> <44A80B20.1090702@goop.org> <1152271537.5163.4.camel@idefix.homelinux.org> <20060707162152.GB3223@redhat.com> <1152312530.14453.16.camel@idefix.homelinux.org> <20060708062345.GB3356@redhat.com> <1152399303.14453.29.camel@idefix.homelinux.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161074AbWGIDVZ@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1152399303.14453.29.camel@idefix.homelinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

On Sun, Jul 09, 2006 at 08:55:02AM +1000, Jean-Marc Valin wrote:
 > > If you're prepared to play around with 'git bisect' a little, it shouldn't
 > > take that many iterations, as you've already narrowed it down quite a lot.
 > > 
 > > $ git bisect start drivers/cpufreq/cpufreq_ondemand.c
 > > $ git bisect bad
 > > $ git bisect good v2.6.12-rc5
 > > 
 > > should get you most of the way there.
 > > 
 > > http://www.kernel.org/pub/software/scm/git/docs/git-bisect.html
 > > has more info.
 > 
 > Could you give me a bit more info, since I've never used git before (I
 > only downloaded the git snapshots)? Also, if I understand correctly,
 > cpufreq_ondemand.c is the only file that could cause the problem. Is
 > that right? Also, is it possible to use an old version of it on a new
 > kernel?

Actually, before deep diving into chasing bugs in ondemand, we should
probably confirm that the same behaviour doesn't happen with a different
governor.  Can you try that ?   Try setting it to userspace, and then
running a userspace app like cpuspeed/powernowd etc.

		Dave

-- 
http://www.codemonkey.org.uk
