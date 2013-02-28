From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH -next 3/3] cpufreq: conservative: Fix relation when
 decreasing frequency
Date: Thu, 28 Feb 2013 11:35:04 +0530
Message-ID: <CAKohpoksRRLmEcpA5g23ZsMmvovVh3=m3sqVUPZqs-j5xQ-V6Q@mail.gmail.com>
References: <1362029882-28993-1-git-send-email-namhyung@kernel.org>
	<1362029882-28993-3-git-send-email-namhyung@kernel.org>
	<CAKohpomiG1G2NUScDpzbqTBJAOfNr3PcWe55PoGK8bvY4tCdMw@mail.gmail.com>
	<87lia9rnah.fsf@sejong.aot.lge.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <87lia9rnah.fsf@sejong.aot.lge.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namhyung Kim <namhyung@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Namhyung Kim <namhyung.kim@lge.com>

On 28 February 2013 11:29, Namhyung Kim <namhyung@kernel.org> wrote:
> When decreasing, we were on a higher frequency than target so selecting
> above or equal to the target frequency seems to be "conservative".

I will buy that. For all three patches:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
