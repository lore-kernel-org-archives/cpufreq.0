From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Can't load speedstep-centrino on IBM x336?
Date: Wed, 26 Oct 2005 10:01:17 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60061F410B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Darrick J. Wong" <djwong@us.ibm.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk


=20

>-----Original Message-----
>From: Darrick J. Wong [mailto:djwong@us.ibm.com]=20
>
>Hmm... ok then, mainline is working.  Thanks for the data!
>
>Unfortunately, RHEL4 U2's "acpi" (it's based on 2.6.9) module doesn't
>work--it prints the "Looking..." message and then "Transition failed."
>when it doesn't find the value it's looking for (0x0E1E) and=20
>gets 0xFFFF

When using SYSTEM_IO, The acpi driver does the IO call with proper
parameters to change the frequency. BIOS then comes in and does the
actual P-state transition in SMM mode (after the cordination across
logical CPUs). After the transition, BIOS is supposed to export the
result in another IO port, which OS tries to read and verify. This
verification was removed in the latest base kernel, but is present in
2.6.9 (and RHEL4).

So, the problem here may be:
1) BIOS is not doing the transition. Hence when OS tries to verify by
readon the status IO port, it sees the transition has failed.
2) BIOS is doing the transition, but not reflecting the status in status
IO port or reporting some error there. Hence again OS fails to see the
change.
3) Some other bug in the OS driver.

Having seen various bugs in different BIOSes related to this, and I am
kind of confident that this also ia a bug in BIOS and not a OS issue.
Can you please check with the BIOS folks on how exactly they are doing
these transitions in SMM. You can also let me know if you need any more
details about the driver itself.

Thanks,
Venki=20

>instead.  Do you have any suggestions?  (If you're not familiar with
>RHEL4, that's fine too.)
>
>--D
>
>Venkatesh Pallipadi wrote:
>> On Mon, Oct 24, 2005 at 11:18:19PM -0700, Darrick J. Wong wrote:
>>=20
>>>Ok, I tried acpi-cpufreq and tried to change the frequency=20
>from 3.6GHz
>>>to 2.8.  scaling_cur_freq says I'm at 2800MHz, but=20
>/proc/cpuinfo still
>>>says 3600.  In dmesg, I see "Writing 0x00000e1e to port=20
>0x0800" at the
>>>very end of the log, but I don't see "Looking for 0x00000e1e=20
>from port
>>>0x0804" like I think I should.  I don't see "Invalid port width..."
>>>either--it's as if we fell out of the function.
>>>
>>=20
>>=20
>> If scaling_cur_freq shows you the right freq, then things=20
>should be working.
>> We recently removed "Looking for * from port" in the common path.
>>=20
>> What /proc/cpuinfo shows kind of depends on other things. I=20
>had this patch=20
>> in my queue that fixes things with /proc/cpuinfo. This=20
>should help here..
>>=20
>> Thanks,
>> Venki
>
