From: Patrick Palka <patrick@parcs.ath.cx>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Sun, 2 Mar 2014 22:42:29 -0500
Message-ID: <CA+C-WL-pnQne-Cz8MuSFPpcHH33ARbRRm-R6VT9aEKzgNHZQQg@mail.gmail.com>
References: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
	<20140226164142.GA18079@thin>
	<CAMpEsFFjR2e_kDn9-QuKcS3RjsSmru9XGjXqXXdO7sYeWdh9dw@mail.gmail.com>
	<20140226170847.GA18427@thin>
	<CAKohpomqu22Pt5_wYV3u2uC36AgfmrkvxLtJCGakdodEQFE-jQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpomqu22Pt5_wYV3u2uC36AgfmrkvxLtJCGakdodEQFE-jQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rashika Kheria <rashika.kheria@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Thu, Feb 27, 2014 at 12:25 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Hi Rashika,
>
> On 26 February 2014 22:08, Rashika Kheria <rashika.kheria@gmail.com> wrote:
>> Mark function as static in cpufreq.c because it is not
>> used outside this file.
>>
>> This eliminates the following warning in cpufreq.c:
>> drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for 'show_boost' [-Wmissing-prototypes]
>
> Can you please elaborate how this warning is related to
> the non-static definition of this function?

-Wmissing-prototypes warns when a non-static function is defined
before a corresponding prototype (usually inside an included header
file) is declared.  In such a case, it is impossible to reference the
non-static function from another file, and therefore the function
should be marked static (usually).  Hope that makes sense!
