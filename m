From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [3.14-rc3] possible regression Haswell runs only at 770Mhz with
 powersave governor
Date: Thu, 20 Feb 2014 08:48:37 -0800
Message-ID: <530631E5.5050104@gmail.com>
References: <53061204.7080700@gmx.net> <20140220150101.GA9557@pd.tnic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=KPp5oYPD1UEkj8uPhj56o+4Qtq1hX5VU6HWIMECXvLc=;
        b=RUVLfsasp90AzxVM4XC/GK5M/MpqPW8sFyi7djQprJNyTs9chUxqTXVJfZIMrh6VJa
         H9f40xZIaQNJQLH7NbDx32kQUm6ovkop01GlrXDUSuaMnPA/L/Bze8hrT0arJ3ICNe5R
         g/z/zGoHffoJFIogA7zQ3LPo0z+5e/vIAOhilXu8fUlwRRh708jfWbrxXSILb6PSDElA
         w1GByd5WltsIfV3+GgbAD58szwqv6SylrqMfHJiGuDYslqRxy3OVuVeI6hGuXbNZt9MT
         DAmYyHwGOJivTm2vT3+7IdWEcC0+2gbgkPOjd7xe24W+hEojvzprnp8bmj80zj/H9r+6
         Jm/w==
In-Reply-To: <20140220150101.GA9557@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Borislav Petkov <bp@alien8.de>, Otto Meier <gf435@gmx.net>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On 02/20/2014 07:01 AM, Borislav Petkov wrote:
> Add lists to CC.
>
> On Thu, Feb 20, 2014 at 03:32:36PM +0100, Otto Meier wrote:
>> Hello,
>>
>> My System which runs with older kernels up to 3.13.3
>> fine on my i3-4330 with 3.5 Ghz and governor powersave.
>> and pstate driver.
>>
>> With kernel 3.14-rc3 and Governor powersave it runs
>> only at 770Mhz and never switches to higher Freq. on load.
>> Even compiling a kernel with make -j4   does not change freq.
>>

commit fcb6a15c2e7e76d493e6f91ea889ab40e1c643a4 seems to be the culprit

>> With governor performance  it switches to 3.5 Ghz and stays
>> there.
>>
>> Any Idea how to fix this?
>>

Greg KH is seeing the same thing on his Haswell system.  I am trying
to figure what went south.

https://lkml.org/lkml/2014/2/19/626


Can you send me the .config for the broken kernel also the output of gcc -v



>> Best regards
>

