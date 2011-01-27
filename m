From: mihn leigh <mihnsk@gmail.com>
Subject: Re: how to do cpu voltage scaling
Date: Thu, 27 Jan 2011 10:43:10 -0800
Message-ID: <AANLkTikau0Zy5wKO4MuO7wVH00+k2R-d-EQq98C7XZpx@mail.gmail.com>
References: <1296119471.4653.2.camel@genix>
	<AANLkTi=4SmWamqkYuJ+P_AVfK_o7Vu=COibxXear=ruO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=aCHWLS93JgrW76ZkERbeAZFOVRLows/OtO1A1IV8SAs=;
        b=gSxVVHB3PozWha427l+j7/jseRXXeMog1XTjXYvQBmUl1fuHIQdpsteBIT0/hU8qCM
         4DqA9IxBc7tVBnFYTKpyid4utzWlE0Nc4oy7mQEwBrym5ohA+aR7wpharSLcYfEB02/S
         M4A34g+ob9labD5JxvD5thj/W9LNO2azZsIjE=
In-Reply-To: <AANLkTi=4SmWamqkYuJ+P_AVfK_o7Vu=COibxXear=ruO@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: satish kumar <gsatish10@gmail.com>
Cc: cpufreq@vger.kernel.org

Oh.. that would be great if i can.
can you tell me more detail?


2011/1/27 satish kumar <gsatish10@gmail.com>:
> yes yo can do
>
> On Thu, Jan 27, 2011 at 2:41 PM, mihn <mihnsk@gmail.com> wrote:
>>
>> Hi,
>>
>> I want to change voltage and frequency seperately.
>> With cpu-freq, i can change frequency, but cannot change voltage AFA=
IK.
>>
>> Can I do this using cpu-freq?
>>
>> If possible, how can I set voltage with the fixed value?
>> If not, is there any way to do that?
>>
>> FYI, i'm using intel i7-core(nehalem) and ubuntu 10.10.
>> FYI2, i found out i can do using IA32_PERF_CTL register, but there's=
 no
>> detail from intel.
>> FYI3, can i change P-state table so that i can only change voltage i=
n P
>> states?
>>
>> Thanks,
>> mihn
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe cpufreq" i=
n
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
