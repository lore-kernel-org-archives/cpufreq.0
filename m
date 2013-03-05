From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH linux-next] cpufreq: conservative: Fix sampling_down_factor
 functionality
Date: Tue, 5 Mar 2013 15:34:20 +0800
Message-ID: <CAKohpokvqe8860J=XO_GXqxpNtrt9XEuUeqCeR=A4PpSaAsHYg@mail.gmail.com>
References: <51351CC3.4010301@semaphore.gr>
	<CAOh2x=m0KLbjGKvLvTH7-yQb4SU5-v=-r4Ba3LSZz=NvfvO6mg@mail.gmail.com>
	<51358117.9060902@semaphore.gr>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <51358117.9060902@semaphore.gr>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 5 March 2013 13:22, Stratos Karafotis <stratosk@semaphore.gr> wrote:
> I had the same thoughts, but I saw the comments in the code:
>
> /*
>  * Every sampling_rate, we check, if current idle time is less than 20%
>  * (default), then we try to increase frequency Every sampling_rate *
>  * sampling_down_factor, we check, if current idle time is more than 80%, then
>  * we try to decrease frequency

I misread it here when i looked at this mail for the first time. :)
I strongly believe that we need a full stop (.) before "Every sampling_rate",
otherwise it looks like we check for down_factor while increasing freq :)

>  *
>
> Also checking the code before the commit 8e677ce83bf41ba9c74e5b6d9ee60b07d4e5ed93 you may see that sampling down factor works in this way.
> So, I decided to keep the original functionality (also down_skip was already there unused).

I got that comment but i belive the code was never according to that comment
and not even now. Check the initial patch for conservative governor:
b9170836d1aa4ded7cc1ac1cb8fbc7867061c98c

Even now we aren't checking this 80% thing, right? And so in your patch we can
actually fix the patch too with the right logic of code.. And
documentation too :)
