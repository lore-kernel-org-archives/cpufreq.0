From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 4/4] cpufreq: Add Kconfig option to enable/disable have_multiple_policies
Date: Wed, 20 Mar 2013 10:46:21 +0530
Message-ID: <CAKohpo=RsUoc+uoy9wmQ1vyg7gE-Gad0QvPukNpGRmOPHrtapQ@mail.gmail.com>
References: <cover.1362381470.git.viresh.kumar@linaro.org>
	<3174774.7AKCbYrzc6@vostro.rjw.lan>
	<CAKohpokwdtSwQmcK=gb2mpzjzp0vpbS7Sra-EhM3QsiQwpog1w@mail.gmail.com>
	<1409962.M4gLo8y6eX@vostro.rjw.lan>
	<CAKohponm_NpYJVcMVcXfMrn+cOFH6OZ2AnWSsVVeSzpmzLM4DQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohponm_NpYJVcMVcXfMrn+cOFH6OZ2AnWSsVVeSzpmzLM4DQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com

On 20 March 2013 09:53, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> But when do you want me to call this function

Guess what, i got answer to this question: struct cpufreq_driver :)
