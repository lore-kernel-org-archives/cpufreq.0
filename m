From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: shmobile: sh73a0: wait for completion when
 kicking the clock
Date: Tue, 19 Mar 2013 14:15:29 +0900
Message-ID: <CANqRtoSk9PQWsU2E5b_CuO9AaE69fZ7GMzSjUz7DjjCY+Xcr2g@mail.gmail.com>
References: <1362054120-8600-1-git-send-email-g.liakhovetski@gmx.de>
	<1362054120-8600-2-git-send-email-g.liakhovetski@gmx.de>
	<20130301025222.GA32306@verge.net.au>
	<20130319034214.GB21444@verge.net.au>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=rzigf/Wv0qnlA1yiIwdoTaALWZmLrNk59o+h4id98hY=;
        b=wYNH+V8GB3NJMM6EI0Fo0RKi96gFX7PpE4yusEOAvsoPoD42yqR2WNSbJtpSPdBy+D
         f842jJ7rTbxtU/EKhmuhpdHvpuMJKRLk5Q7N4sc9Xlz80Ine3yhINxk1CiTJgXf4VKRG
         5sj70hxIw/qyt+h27tDa95sNg0NBzgVZ0WvvUsshAJCDpmqHd9niVhm5cCMVQibZrYIG
         QOXjkJF+36avmhL7m+aRhD+3inezqukKfLHWrIfGBbLQVkmh0Qf9DihkRwfDWdZPk8MO
         /6rvT3qUQega46/iQpE7m56xv57J3wywH9i6fEqL70+oEf5ewKI0Mza8xXyEsqfOLIWf
         P57w==
In-Reply-To: <20130319034214.GB21444@verge.net.au>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

On Tue, Mar 19, 2013 at 12:42 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Mar 01, 2013 at 11:52:25AM +0900, Simon Horman wrote:
>> On Thu, Feb 28, 2013 at 01:21:58PM +0100, Guennadi Liakhovetski wrote:
>> > To reconfigure clocks, controlled by FRQCRA and FRQCRB, a kick bit has to
>> > be set and to make sure the setting has taken effect, it has to be read
>> > back repeatedly until it is cleared by the hardware. This patch adds the
>> > waiting part, that was missing until now.
>> >
>> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>>
>> This patch seems to be ready to be applied.
>>
>> Magnus, could I get a review from you?
>
> Magnus, ping.

Thanks for the ping. This patch looks good to me.

Acked-by: Magnus Damm <damm@opensource.se>

Now if we could do the same thing for the MSTP bits too then that
would be excellent...

/ magnus
