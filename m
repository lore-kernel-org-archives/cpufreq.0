From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 13:21:33 +0800
Message-ID: <CAKohpokp_-awmmRJ3Vj0vNpORe3cvoZ0+YBW6_pPZxj6_M_OmA@mail.gmail.com>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
	<531F4EE3.4080701@gmail.com>
	<3356262.4cDuororSJ@vostro.rjw.lan>
	<531F6D2D.7070306@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <531F6D2D.7070306@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Patrik Lundquist <patrik.lundquist@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>

On 12 March 2014 04:08, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> Zero frequency the core is not running.  I said it is a valid answer not
> that I should be returning it.  There is nothing in the docs or headers that
> I can
> find that says Zero is a failure value.

In this case cpufreq_add_dev() shouldn't have been called for this CPU
then. And so its obviously better to return error in such cases.
