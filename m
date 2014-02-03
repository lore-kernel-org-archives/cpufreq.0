From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: double deletion of timer.
Date: Mon, 3 Feb 2014 16:44:33 +0530
Message-ID: <CAKohpok5p_2jcOJxrN5PvsQYm6BXBEgCu396gz7L-ryNfHftAg@mail.gmail.com>
References: <CAH9_wRP-LQnenkBrG2i96G4zKTiWsQH1BXHoPCD5Kw0xam=fPQ@mail.gmail.com>
	<CAH9_wRMXcaFE8e+MRkTP-zK1AChpDfrYLgL+R4uoKLO3qRY=+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAH9_wRMXcaFE8e+MRkTP-zK1AChpDfrYLgL+R4uoKLO3qRY=+w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sriram V <vshrirama@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM List <linux-pm@lists.linux-foundation.org>

On 27 January 2014 20:46, Sriram V <vshrirama@gmail.com> wrote:
> Looping in linux-pm and viresh to see if they can advice.

Sorry for delay, as I was away on vacation.

> Hi,
>
> am trying to debug an random issue in which __list_del gets a prev
> pointer which is LIST_POISON, But the next pointer contains a valid
> value.
> There seems to be a double deletion. Since the next pointer is valid -
> It determines that the timer is pending and tries to delete it
> resulting in a crash.
>
> I am trying to understand when this could happen from the cpufreq governor.
>
> There are a couple of new patches recently applied in the kernel that
> deal with timer corruption. Not sure if they take care of this.

I need more information on this as I haven't experienced it.
- Which kernel you tested this on?
- Can you try on latest one? i.e. 3.13?
- How do you reproduce it? Guaranteed steps?

--
viresh
