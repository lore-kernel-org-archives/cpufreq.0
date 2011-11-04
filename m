From: Lei Yu <y.benben.y@gmail.com>
Subject: Re: Question: cpufreq_stats is not available in sysfs
Date: Thu, 3 Nov 2011 20:34:04 -0700
Message-ID: <CAHqxzWw9Rw_bGN5kDTr5pVhDj+wvTxvTxBayj365w-gb7m7-5g@mail.gmail.com>
References: <CAHqxzWxXPCkn_qzbOsZ_=ziafjRNUYTPOnVYgnOGa7+E_26Zpg@mail.gmail.com>
	<CAHqxzWxbpAHBSOwgsvRSb+t7hT18zkC6hrscvBjW_nc=KaLj5w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=mIGTClb/LLqy9Ijm1ZswjqIDgU52+B8AIBb4/Glh1m4=;
        b=ROVB5z3ddSNXXWyC9ZjGg+YDmjQn8dwCA8N+mEkmfM0snAAdowdYkgJL6RUWb0Gthu
         fIPJ9R/iqLiqNq+iHGWW7ARZJyPA/aRn3RE5Em+9UM2q7pygtp8Fnan4SJ/C1HpvUWOS
         xVPU6csJ+6EPI2IHc6C65yqrSXkyFUmncod1o=
In-Reply-To: <CAHqxzWxbpAHBSOwgsvRSb+t7hT18zkC6hrscvBjW_nc=KaLj5w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

I figured out the problem, please ignore the post, Sorry for the spam.

On Thu, Nov 3, 2011 at 12:29 PM, Lei Yu <y.benben.y@gmail.com> wrote:
> One correction below.
>
> On Thu, Nov 3, 2011 at 11:55 AM, Lei Yu <y.benben.y@gmail.com> wrote:
>> Hi,
>> =A0 I tried to use cpufreq_stats to do some performance anlaysis but=
 I
>> did not see cpufreq_stats entries under sysfs on my Linux machine. I
>> am wondering if anyone can help me point out what could be the
>> problem.
>> =A0 Here are more detailed info
>> =A0 =A0 =A01). My kernel version is: 3.0.1
>> =A0 =A0 =A02). cpufreq and cpufreq_stats has been built into the ker=
nel
>> image rather than as a separate, standalone kernel modules.
>> =A0 =A0 =A03). I can see cpufreq related sysfs entries under:
>> /sys/devices/system/cpu/cpufreq and
>> /sys/devices/system/cpu/cpu0/cpufreq.
>> =A0 =A0 =A04). But when I looked under above two directories, I did =
not
>> see cpufreq_stats related entries.
>> =A0 Also, when I looked at the code of the cpufreq_stats.c, I see th=
e
>> logics like this:
>> =A0 =A0 =A0--> cpufreq_stats sysfs is only created inside
>> cpufreq_stats_create_table()
>> =A0 =A0 =A0--> cpufreq_stats_create_table() is either invoked inside
>> cpufreq_stat_notifier_policy() or cpufreq_stats_create_table_cpu().
>> =A0 =A0 =A0--> cpufreq_stats_create_table_cpu() is only invoked if a=
 CPU
>> is CPU_DOWN_FAILED or CPU_DOWN_FAILED_FROZEN which will not happen i=
n
>> my environment.
>> =A0 =A0 =A0--> And, cpufreq_stats_init() will unregister
>> CPUFREQ_POLICY_NOTIFIER if registering of CPUFREQ_TRANSITION_NOTIFIE=
R
>> is successful.
>> =A0 =A0 =A0So, cpufreq_stats sysfs entries will not exist? I am sure=
 I
>> have mis-read the code somehow.
>
> Please ignore my explanation of the code above since I missed the ear=
ly return.
>
>>
>> Really appreciate your help.
>>
>> Lei Yu
>>
>> P.S. I am new to Linux kernel mailing list, if I am not following an=
y
>> of the style, pls do let me know.
>>
>
