From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH][RFC] ondemand governor automatic downscaling
Date: Sun, 6 Mar 2005 17:51:51 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600426C6EA@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@zenii.linux.org.uk


>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Sunday, March 06, 2005 4:54 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@zenii.linux.org.uk
>Subject: Re: [PATCH][RFC] ondemand governor automatic downscaling
>
>Pallipadi, Venkatesh a =E9crit :
>:
>:
>> In particular, this will not work well in the following situation:
>> Assume a server with a constant read/write to disk. Say the=20
>CPU computes
>> something for 40% of time and then issues a I/O and waits=20
>for remaining
>> 60% of time (until I/O is complete). This wait is irrespective of CPU
>> speed. Now if we reduce the frequency to make CPU 70% busy,=20
>and CPU will
>> still wait for IO and overall performance will go down as a result of
>> the frequency slowdown.=20
>> This can still happen with 20-80 policy, but the probablity is less.
>Well, if I understand correctly, we lose time because the harddisk is=20
>waiting for the CPU to do some computing before it can write anything=20
>and the slowest is the CPU, the longer the harddisk will have to wait.=20
>IMHO, this situation seems very unlikely because of all the I/O=20
>virtualisation done by the kernel, including read-ahead and cache. The=20
>harddisk will completely turn asynchronously, 100% of the time, while=20
>the CPU will do computation during 70% of the time instead of=20
>40%, still=20
>having idle time. This shouldn't affect global performance.=20
>Still, I can=20
>be overlooking something, do you have any testcase in mind?
>

It was just a theoritical possibility or sort of a corner case.
But, as you said, that can be handled by having iowait as busy time.
Probably by having another tuning parameter for iowait time.

I will run this patch on couple of SMP systems, with some workload.=20
I just want to make sure there are no side-effects before pushing=20
this to the base. I should be able to get back on this in couple of =
days.=20

Thanks again for the patch,
Venki
