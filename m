From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 1/3] cpufreq: Make sure frequency transitions are serialized
Date: Fri, 21 Mar 2014 13:28:04 +0530
Message-ID: <CAKohpom8ZHXxVmuSHYL5nyZzNrK8EFNVdx5XJdJxiHWPb13aeg@mail.gmail.com>
References: <cover.1395379422.git.viresh.kumar@linaro.org>
	<f6116069b730c0c3a74ff627fa818b98dc4f1491.1395379422.git.viresh.kumar@linaro.org>
	<532BEE64.3090501@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <532BEE64.3090501@linux.vnet.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "ego@linux.vnet.ibm.com" <ego@linux.vnet.ibm.com>

On 21 March 2014 13:16, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:
> Wonderful! I was going to do this today, but thanks a lot for taking
> care of this for me!

I just wanted to finish this long lasting thread as soon as possible.

> We need this assignment to happen exactly at this point, that is, *after*
> the call to post_transition() completes and before calling wake_up().
>
> If the compiler or the CPU reorders the instructions and moves this
> assignment to some other place, then we will be in trouble!
>
> We might need memory barriers to ensure this doesn't get reordered.
> Alternatively, we can simply hold the spin-lock around this assignment,
> since locks automatically imply memory barriers. As an added advantage,
> the code will then look more intuitive and easier to understand as well.
>
> Thoughts?

I may be wrong but this is how I understand locks. Yes, spinlocks have
memory barriers implemented but it wouldn't guarantee what you are
asking for in the above explanation.

It will guarantee that transition_ongoing will be updated after the lock
is taken but the notification() can happen after the lock is taken and
also after the variable is modified.

You can find some information on this in
Documentation/memory-barriers.txt

I don't think compiler or CPU will reorder calls to a function and
updates of a variable. And so this code might simply work. And
I hope there would be plenty of such code in kernel.
