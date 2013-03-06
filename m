From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/3 linux-next] cpufreq: conservative: Fix
 sampling_down_factor functionality
Date: Wed, 6 Mar 2013 14:48:54 +0800
Message-ID: <CAKohpo==-3oqocx-7fbrYx=cFZJ9vgVZ1di3v2T8TZcissbf5w@mail.gmail.com>
References: <51366C65.7070802@semaphore.gr>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <51366C65.7070802@semaphore.gr>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 6 March 2013 06:06, Stratos Karafotis <stratosk@semaphore.gr> wrote:
> sampling_down_factor tunable is unused since commit
> 8e677ce83bf41ba9c74e5b6d9ee60b07d4e5ed93 (4 years ago).
>
> This patch restores the original functionality and documents the
> tunable.
>
> Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
> ---
>  Documentation/cpu-freq/governors.txt   |  6 ++++++
>  drivers/cpufreq/cpufreq_conservative.c | 11 ++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
