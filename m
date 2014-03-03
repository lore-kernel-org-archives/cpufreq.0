From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Mon, 3 Mar 2014 12:50:43 +0530
Message-ID: <CAKohpok3UZbQZBFM5FWP3tXFDGHm+j3-zP-rYUCF1fPTxAYp9g@mail.gmail.com>
References: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
	<20140226164142.GA18079@thin>
	<CAMpEsFFjR2e_kDn9-QuKcS3RjsSmru9XGjXqXXdO7sYeWdh9dw@mail.gmail.com>
	<20140226170847.GA18427@thin>
	<CAKohpomqu22Pt5_wYV3u2uC36AgfmrkvxLtJCGakdodEQFE-jQ@mail.gmail.com>
	<CA+C-WL-pnQne-Cz8MuSFPpcHH33ARbRRm-R6VT9aEKzgNHZQQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CA+C-WL-pnQne-Cz8MuSFPpcHH33ARbRRm-R6VT9aEKzgNHZQQg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Palka <patrick@parcs.ath.cx>
Cc: Rashika Kheria <rashika.kheria@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 3 March 2014 09:12, Patrick Palka <patrick@parcs.ath.cx> wrote:
> -Wmissing-prototypes warns when a non-static function is defined
> before a corresponding prototype (usually inside an included header
> file) is declared.  In such a case, it is impossible to reference the
> non-static function from another file, and therefore the function
> should be marked static (usually).  Hope that makes sense!

I understand that it should be made static as we don't have a
prototype in any other header file, but I thought we shouldn't
get the warning we are getting.

warning: no previous prototype for 'show_boost'

Because we have prototype/definition of function before it is used.
Maybe a warning like:

local function should be marked static could have been there ;)
