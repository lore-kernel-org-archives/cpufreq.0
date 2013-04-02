From: Stratos Karafotis <stratosk@semaphore.gr>
Subject: Re: [PATCH v3 linux-next] cpufreq: ondemand: Calculate gradient of
 CPU load to early increase frequency
Date: Tue, 02 Apr 2013 18:49:14 +0300
Message-ID: <515AFDFA.8090108@semaphore.gr>
References: <51253715.7080600@semaphore.gr> <CAKohpokKCrvMYWQCRWccDJHbBNO7km5-vP=d3TwhDyU7HGX-YA@mail.gmail.com> <51561556.7020904@semaphore.gr> <1544183.cq3KaqH8x3@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1544183.cq3KaqH8x3@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/02/2013 04:50 PM, Rafael J. Wysocki wrote:
> Do you have any numbers indicating that this actually makes things better?
> 
> Rafael

No, I don't.
The expected behaviour after this patch is to "force" max frequency few sampling periods earlier.
The idea was to increase system responsiveness especially on 'small' embedded systems (phones for example).

Actually, I thought to provide some numbers but I had no idea how to measure this.

Would it be enough to provide the number of times that the CPU increases frequency 
because of early_demand versus the total number of increments? 


Thanks,
Stratos
