From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH 2.6.18-rc6-mm1 0/2] cpufreq: make it harder for cpu to
 leave "hot" mode
Date: Thu, 14 Sep 2006 14:38:03 -0700
Message-ID: <20060914143803.493c5bf0.akpm@osdl.org>
References: <20060912032924.GA3677@nickolas.homeunix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751123AbWINVi0@vger.kernel.org>
In-Reply-To: <20060912032924.GA3677@nickolas.homeunix.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Orlov <bugfixer@list.ru>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk, Dave Jones <davej@codemonkey.org.uk>

On Mon, 11 Sep 2006 23:29:24 -0400
Nick Orlov <bugfixer@list.ru> wrote:

> I was playing with ondemand cpufreq governor (gotta save on electricity
> bills one day :) ) and I've noticed that gameplay become somewhat sluggish.
> Especially noticeble in something cpu-power demanding, like quake4.
> Quick look at stats/trans_table confirmed that CPU goes out of "hot" mode
> way too often.

I won't apply any of this in view of your ongoing discussion with
Venkatesh, but thanks for the ongoing support and help - cpufreq is, shall
we say, a rich source of future kernel improvements.

Next time you prepare a patch series please ensure that it uses a different
Subject: for each patch, as per
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt, section 2.

