From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/5] cpufreq: Remove temporary fix for race between CPU
 hotplug and sysfs-writes
Date: Tue, 10 Sep 2013 14:27:47 +0530
Message-ID: <522EDF0B.60308@linux.vnet.ibm.com>
References: <20130906195206.26919.20884.stgit@srivatsabhat.in.ibm.com> <20130906195353.26919.76123.stgit@srivatsabhat.in.ibm.com> <CAKohpon96ecA3L9ux0tnFngPbWDmrVfW3xUWf_3aZ5qYZGXLVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpon96ecA3L9ux0tnFngPbWDmrVfW3xUWf_3aZ5qYZGXLVw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Boyd <sboyd@codeaurora.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09/10/2013 12:39 PM, Viresh Kumar wrote:
> On 7 September 2013 01:23, Srivatsa S. Bhat
> <srivatsa.bhat@linux.vnet.ibm.com> wrote:
>> Commit "cpufreq: serialize calls to __cpufreq_governor()" had been a temporary
>> and partial solution to the race condition between writing to a cpufreq sysfs
>> file and taking a CPU offline. Now that we have a proper and complete solution
>> to that problem, remove the temporary fix.
>>
>> Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
>> ---
> 
> I would still vote for keeping this code or reverting this patch of yours..
> As there might be other scenarios, than hotplug races, where this serialization
> would be useful..
> 

I would say it would be better to first explain those scenarios in detail, and
then justify why this solution is the best one. Without that, it starts appearing
more like premature optimization... and we all know the mess that it can lead to ;-)

Regards,
Srivatsa S. Bhat

