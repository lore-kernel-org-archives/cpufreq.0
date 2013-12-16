From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: Regression with suspend resume 5a87182aa21d6d5d306840feab9321818dd3e2a3
Date: Mon, 16 Dec 2013 17:06:58 +0530
Message-ID: <52AEE5DA.1010102@linux.vnet.ibm.com>
References: <52A448F2.4010208@redhat.com> <CAKohpomO+0q7bFWTnFRgqoRuU2WryfPpFv0WLOCKtHBrLzLRqw@mail.gmail.com> <87iouprrcw.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <87iouprrcw.fsf@nemi.mork.no>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Lan Tianyu <tianyu.lan@intel.com>, jinchoi@broadcom.com, Paul Bolle <pebolle@tiscali.nl>, ziegler@email.mathematik.uni-freiburg.de, jbarnes@virtuousgeek.org, Linux PM mailing list <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>

On 12/16/2013 04:32 PM, Bj=C3=B8rn Mork wrote:
> Viresh Kumar <viresh.kumar@linaro.org> writes:
>> On 8 December 2013 15:54, Zdenek Kabelac <zkabelac@redhat.com> wrote=
:
>>> I'm testing recent 3.13-rc kernel - and I've notice my Lenovo T61 i=
s not
>>> able to resume.  After bisect I've found commit:
>>>
>>> 5a87182aa21d6d5d306840feab9321818dd3e2a3
>>
>> That's my patch, sorry for all the trouble.. Just came back after va=
cations
>> and multiple threads are there with this patch as culprit..
>>
>> I just tested this patch again on Rafael's linux-next branch and sus=
pend/resume
>> and Hibernation are working fine for me on my Thinkpad T420. I don't=
 see any
>> issues at all..
>>
>> scaling_governor: ondemand
>> scaling_driver: acpi-cpufreq
>>
>>> When I just revert this commit with 374b105797c3d4f29c685f3be535c35=
f5689b30e
>>> (3.13-rc3)   suspend/resume works again.
>>> (I'm using  ondemand CPU governor)
>>
>>> Here is bisect log:
>>
>>> # bad: [2167e2399dc5e69c62db56d933e9c8cbe107620a] cpufreq: fix garb=
age
>>> kobjects on errors during suspend/resume
>>> git bisect bad 2167e2399dc5e69c62db56d933e9c8cbe107620a
>>
>> I don't read bisect logs well but doesn't you log say that the culpr=
it is
>> 2167e2399dc5e69c62db56d933e9c8cbe107620a instead?
>>
>> I am trying with this patch now, but will take some time for results=
 to be out.
>=20
> It's both patches in combination.  Interesting case, really :-)
>

True... Basically, what happens is that commit 5a87182 prevents POLICY_=
EXIT
of governors during suspend - ie., it just does a CPUFREQ_GOV_STOP and =
prevents
any further operations on governors.

Later, commit 2167e23 removes the special suspend/resume handling for C=
PU hotplug
and thus in this path, CPU offline sends out POLICY_EXIT and also frees=
 up the
memory allocated to the policy structure. Since POLICY_EXIT is prevente=
d by the
cpufreq_suspend() code, this tear-down only gets half-completed and thu=
s goes
into an inconsistent state.

So, upon resume, the CPU online operation tries POLICY_INIT, GOV_START =
etc,
and again none of these get executed because of the cpufreq_suspend() c=
ode.
Eventually cpufreq_resume() will execute GOV_START, but by then the und=
erlying
policy-structure is a newly allocated one, and things have already been=
 messed
up so much that it just can't resume properly.

Overall, the inconsistency in handling governor code during suspend/res=
ume
is the root-cause of the suspend/resume regression. And as Bjorn mentio=
ned,
this is caused by the interaction of the 2 commits with one another, an=
d cannot
be reproduced by either of the commits independently.

IIUC, mainline should be fine now, since Rafael reverted both the commi=
ts. We
need to be more careful in bringing back either functionality in the fu=
ture.
As Bjorn and Rafael rightly pointed out in the other email threads, we =
need to
fundamentally rethink the design and come up with elegant interfaces/me=
chanisms
in the cpufreq subsystem that will allow us to write code that works as=
 expected
and avoid such subtle regressions.


Regards,
Srivatsa S. Bhat

