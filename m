From: Parag Warudkar <parag.lkml@gmail.com>
Subject: Re: intel_pstate_timer_func divide by zero oops
Date: Thu, 28 Mar 2013 14:25:55 -0400
Message-ID: <CAOULuOa70BDS8Sq2p9oC9MZGzjngJD5FB5Wdk4Sk1FXRJKrAnQ@mail.gmail.com>
References: <alpine.LFD.2.03.1303272103380.8412@gmail.com>
	<5153B03E.2050201@gmail.com>
	<CAOULuOa1O5LxwDh6peSGBRR9PyeEtXuhyiaFVvKnFNiqrb4bfQ@mail.gmail.com>
	<51546359.8000002@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=j4oQY9RRzzgVDcDqwO4ouVC/05KSn4zOFIT/HqtGeNo=;
        b=wDAR7JvlljL0suPscu31w9C21Ir1LJXwNaS2Ta6YJT9gjTqTPsaZOhria8grisISuK
         JNn+AUogYQoDppykyGzdpWzc+FWlTp68JqDXCHKUqy5D4D4s4J4q0kzoHEb0fXw+6Hf4
         sR8ASko/VmgYO0q536nn8biCtM7oeMtF79RtcaJDMx7P/6d/KUeV0V6+x+3zvg0BWiXo
         rvAY3oQeYCpoUsy26sDia4IPr/i1DgLRasSiivRQHmV99RzfCcOMUM6hgbolw291ljBZ
         Ho6QFwWv/11FmTc2yJ58O2wLZNhQ72pMtuXrVZCUj+GO26NTi51CUtg4zszBBnRB8LOS
         tmgw==
In-Reply-To: <51546359.8000002@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Thu, Mar 28, 2013 at 11:35 AM, Dirk Brandewie
<dirk.brandewie@gmail.com> wrote:
>>> pid_param_set() is on the stack which means that something is changing
>>> the debugfs parameters or the stack is FUBAR.
>>>
>> I somehow doubt the stack is messed up as the call traces are always
>> identical.
>> (pid_param_set() seems to be in first trace as well.)
>>
>
> I agree that the two oops are likely the same but unless something is
> crawling
> through debugfs writing random values to the files there pid_param_set()
> should not be on any stack anywhere.

Ok.

>
> There was a similar bug reported by fedora:
> https://bugzilla.redhat.com/show_bug.cgi?id=920289
>
> This bug has not showed up again since rc3 can you try the current rc to see
> if
> you still see the problem?
>

I updated the Fedora BZ - the oops I got is from latest git as of
yesterday. So I think the bug is still there post -rc3.

Parag
