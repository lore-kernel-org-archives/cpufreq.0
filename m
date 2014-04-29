From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: intel_pstate: Change the calculation of next pstate
Date: Tue, 29 Apr 2014 10:28:02 +0530
Message-ID: <CAKohpomhUk7RQ3YL3=wpVKSbK_oSkyYBRUZiqnHzWqrZ2DjRRA@mail.gmail.com>
References: <535D80C8.9090906@semaphore.gr>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <535D80C8.9090906@semaphore.gr>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>, Dirk Brandewie <dirk.j.brandewie@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Cc'd Dirk,

On 28 April 2014 03:42, Stratos Karafotis <stratosk@semaphore.gr> wrote:
> Currently the driver calculates the next pstate proportional to
> core_busy factor and reverse proportional to current pstate.
>
> Change the above method and calculate the next pstate independently
> of current pstate.

We must mention why the change is required.
