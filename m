From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3] powernow-k6: reorder frequencies
Date: Tue, 17 Dec 2013 14:17:36 +0530
Message-ID: <CAKohpok_+Dxk0G3hutAtejjhNOj5d2uK+58C6TBf-KuU+Xc7eA@mail.gmail.com>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.1312111937570.23022@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.1312111938370.23022@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.1312111938580.23022@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1312111938580.23022@file01.intranet.prod.int.rdu2.redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 12 December 2013 06:09, Mikulas Patocka <mpatocka@redhat.com> wrote:
> This patch reorders reported frequencies from the highest to the lowest,
> just like in other frequency drivers.

This isn't required I believe.. cpufreq core doesn't enforce any restrictions
on order of freqs present in table.
