From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq_stats NULL deref on second system suspend
Date: Wed, 11 Sep 2013 16:45:12 +0530
Message-ID: <CAKohpo=Wg=e0_+N1Vmx2m6monFMrbdFSfGE_Ufr0D0_kunreFw@mail.gmail.com>
References: <522E1FEF.6080803@wwwdotorg.org>
	<1775778.MeiRhuYy7o@vostro.rjw.lan>
	<522F86AD.6010603@wwwdotorg.org>
	<2521560.SfeNbV74nj@vostro.rjw.lan>
	<52304439.3030301@linux.vnet.ibm.com>
	<CAKohpokTVzikxunqSdUYmLjTOkfhWFJ=N4TTa4rdbj2euCFY-g@mail.gmail.com>
	<52304F92.6030109@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <52304F92.6030109@linux.vnet.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Warren <swarren@wwwdotorg.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cpufreq <cpufreq@vger.kernel.org>

On 11 September 2013 16:40, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:
> On 09/11/2013 04:14 PM, Viresh Kumar wrote:
>> On 11 September 2013 15:51, Srivatsa S. Bhat
>> <srivatsa.bhat@linux.vnet.ibm.com> wrote:
>>> On 09/11/2013 04:04 AM, Rafael J. Wysocki wrote:
>>>> On Tuesday, September 10, 2013 02:53:01 PM Stephen Warren wrote:
>>
>>>>> Sure, it's due to 5302c3f "cpufreq: Perform light-weight init/teardown
>>>>> during suspend/resume".
>>
>> Sorry Stephen, I was away on vacations and came back yesterday only..
>> And was badly stuck in something other CPUFreq bugs until now :)
>>
>>> Sure, Rafael. Thanks for CC'ing me.
>>
>> Thanks for jumping in and helping us out buddy!!!.
>>
>
> No problem :-) Besides, I am the one who broke it ;-(

I believe you missed some part of my mail ?
