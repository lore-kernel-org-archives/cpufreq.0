From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Query]: CPUFREQ: Affected and related cpus in cpufreq
Date: Wed, 10 Oct 2012 19:37:58 +0530
Message-ID: <CAKohpono18oYGDJg7h0EZ6E6Uqo_v40ofRNQOG5VLwwGMO8pTw@mail.gmail.com>
References: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw@mail.gmail.com>
	<50756396.9040705@arm.com>
	<CAKohponw2kGOewdnyicPiup5pa1bqdSo2mWicHiuLM0F0_OREg@mail.gmail.com>
	<50757BC1.3050401@arm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50757BC1.3050401@arm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, spear-devel <spear-devel@list.st.com>

On 10 October 2012 19:14, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> Here is my understanding on this patch. This change is closely related
> to ACPI cpufreq driver(used mostly on Intel cores). This change was
> introduced to keep track of the related cpus as returned by ACPI
> firmware along with affected cpus as imposed by SW. I don't understand
> the exact difference in Intel cores.
> I believe it's just for tracking and not used much in the driver.

Then i believe we shouldn't fill the related_cpus field for ARM cores. As anyway
the show_related_cpus will pick affected cpus in that case.

--
viresh
