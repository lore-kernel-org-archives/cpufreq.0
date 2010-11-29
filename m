From: David C Niemi <dniemi@verisign.com>
Subject: Re: Issues with ondemand governor
Date: Mon, 29 Nov 2010 10:16:04 -0500
Message-ID: <4CF3C3B4.3000209@verisign.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com> <4CEA959F.9000505@verisign.com> <20101126223815.GU30563@anthem.async.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101126223815.GU30563@anthem.async.com.br>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Robottom Reis <kiko@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Vishwanath Sripathy <vishwanath.sripathy@linaro.org>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org

I certainly have no objections to it going into the Linaro tree, though
I was hoping to get it into the main kernel tree too.

DCN

Christian Robottom Reis wrote:
> On Mon, Nov 22, 2010 at 11:09:03AM -0500, David C Niemi wrote:
>   
>> The general problem here is that the ondemand governor is aimed more at
>> power savings than performance.  In cases where the ondemand governor
>> performs worse than the performance governor, the "sampling_down_factor"
>> tunable is often useful.  I submitted the patch to add this tunable a
>> few weeks ago and it was acked by Venki, but I don't know what happened
>> to it after that.
>>     
>
> Would you like to get it merged into linux-linaro? Given it's been ack'd
> I think Nicolas might be willing to consider it:
>
>     http://kerneltrap.org/mailarchive/linux-kernel/2010/10/6/4628889/thread
>   

