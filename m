From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: CPUFreq dynamic speed governor, take 2.
Date: Sat, 1 Nov 2003 19:46:20 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB600779D0@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>, Jon Anderson <janderson@janderson.ca>
Cc: cpufreq@www.linux.org.uk



> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@brodo.de]=20
>=20
> That's not entirely correct -- it just has rather strict limits on the
> "transition latency", and several cpfureq drivers don't set the proper
> transition latency but the dummy value "CPUFREQ_ETERNAL"=20
> which disables
> dynamic governors [in kernelspace].


We can change ondemand governor to expose the minimum transition=20
latency through sysfs, if that helps. But then, the sampling frequency=20
should depend on the transition latency, in order to make sure that=20
sampling itself will not be a performance overhead.


> > +config CPU_FREQ_DEFAULT_GOV_DYNAMIC
> "Dynamic" governors can't be default governor -- they can fail due to
> transition latency limits, and would leave the cpufreq core=20
> in an undefined
> state then. Also, the name "dynamic" is too generic as there=20
> likely will be
> different dynamic cpufreq governors available.


This is the same reason why I removed the default option in the=20
latest version of ondemand governor.
Having said that, I think better option here is to have a =20
list of governor's defined in some order, instead of=20
having one default governor. And during initialization we=20
can call init of each governor in the list, until we succeed.=20
Similar logic is used in various places in kernel,
like i386 timer initialization, i386 sub-arch detection etc.


> Actually, this is a problem in Venkatesh's code: If the=20
> governor says "there's
> too few processing power available, let's increase the speed"=20
> it increases
> the current speed by 1 kHz, and says this is a "low limit"=20
> which means that
> the new speed must be higher than that. For the common=20
> frequency scaling
> implementations out there, which define only few frequency=20
> states, this is
> not a problem. For the geode driver, though, which has=20
> several thousand
> frequency states available IIRC, this is a big problem: switching from
> lowest to highest speed may take a couple of seconds or even minutes!


Yes. I had assumed that the number of states is of the order of 5-10.=20
If we have several thousand states then, ondemand governor will be crawl
on=20
its knees. The reason I had to depend on +1, -1 logic, is because I
couldn't
find any other simple/clean way of getting the supported frequencies
from
the low level frequency driver.


Thanks,
-Venkatesh
