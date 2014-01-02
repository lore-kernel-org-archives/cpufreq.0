From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 3/3] powernow-k6: reorder frequencies
Date: Thu, 2 Jan 2014 12:40:52 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401021238460.16351@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111937570.23022@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111938370.23022@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1312111938580.23022@file01.intranet.prod.int.rdu2.redhat.com> <CAKohpok_+Dxk0G3hutAtejjhNOj5d2uK+58C6TBf-KuU+Xc7eA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKohpok_+Dxk0G3hutAtejjhNOj5d2uK+58C6TBf-KuU+Xc7eA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On Tue, 17 Dec 2013, Viresh Kumar wrote:

> On 12 December 2013 06:09, Mikulas Patocka <mpatocka@redhat.com> wrote:
> > This patch reorders reported frequencies from the highest to the lowest,
> > just like in other frequency drivers.
> 
> This isn't required I believe.. cpufreq core doesn't enforce any restrictions
> on order of freqs present in table.

But the cpufreq-info tool lists the frequencies misordered.

This is not a serious bug. The patch just makes the output of cpufreq-info 
look better.

Mikulas
