From: Luca <luca.foppiano@gmail.com>
Subject: Re: cpufreq on Coppermine (=> modprobe speedstep_smi smi_port=0xb1
	smi_cmd=0x82)
Date: Sun, 20 Nov 2005 10:28:54 +0100
Message-ID: <460afdfa0511200128l3b235579t2114cc138ead14b3@mail.gmail.com>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051120025915.GA7617@kroworsch.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051120025915.GA7617@kroworsch.de>
Content-Disposition: inline
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
To: Wolfgang Kroworsch <wolfgang@kroworsch.de>
Cc: cpufreq@lists.linux.org.uk

On 11/20/05, Wolfgang Kroworsch <wolfgang@kroworsch.de> wrote:
> Hi Luca,
>
> some time ago I used my Pentium III (Coppermine, 600 MHz) notebook from
> Maxdata. The only possibility to get the right speedstep settings was to
> look at the drivers of windows.

ok..
>
> As I do not know which laptop from Packard Bell you use, I just looked
> for some old ones on their webpage. I found the Chrome@ with 700MHz and
> the drivers for speedstep:
> http://support.packardbell.com/uk/mypc/?PibItemNr=3Dplatform_R3&PibLinkGr=
oup=3D2000#show
> Link to "Intel Speedstep Applet 2.3"
> http://support.packardbell.com/uk/mypc/?PibItemNr=3DREFFIUP02670500&PibIt=
emParent=3Dplatform_R3#show
> =3D> http://support.packardbell.com/uk/mypc/?dwn=3DREFFIUP02670500;speeds=
tep23.exe
>
> This "zip"-file speedstep23.exe (just unzip it with 'unzip) contains a
> file named Registry.ini which tells the system-dependent settings:
>     [PRPC]
>     Port=3D0x000000B1
>     Command=3D0x00000082
>     ...
>
I have download the speedstep's applet from the packard bell support
site and the file Registry.ini is:

[PRPC]
Port=3D0x000000B1
Command=3D0x00000082
Flags=3D0x10000232
UserPrefs=3D0x00000005
SystemPrefs=3D0x00000303
EventRegister=3D0x00000000
SetStateRetry=3D0x00000400
AppletTimeout=3D0x00000078
PollPeriod=3D0x000007d0
DBSPeriod=3D0x012c03e8
DBSThreshold=3D0x005f005f
MBPeriod=3D0x07d01388
MBPoll=3D0x0000012c
MBPrefs=3D0x00000000
MBThreshold=3D0x0032005a
W2KTimer=3D0x00000001


> For _my_ notebook the respective file says 0xB2 and 0x82, and the
> options for my speedstep_smi in modules.conf are:
>     options speedstep_smi smi_port=3D0xb2 smi_cmd=3D0x82
>
> You should verify, that you get the correct files for your laptop, but I
> think that this should be the easiest way to get the right settings.
> I think, that _you_ should use:
>     options speedstep_smi smi_port=3D0xb1 smi_cmd=3D0x82
>
> Due to these options my laptop is able to run at 500 MHz and 600 MHz
> without any problems :-).
> The notebook is running linux-2.6.6-vanilla.
I have vanilla 2.6.14...and I try to use speedstep_smi smi_port=3D0xb1
smi_cmd=3D0x82 but  return me no such device...and this is the result of
debug:

Nov 20 10:22:01 cristal kernel: speedstep-lib: x86: 6, model: 8
Nov 20 10:22:01 cristal kernel: speedstep-lib: Coppermine:
MSR_IA32_EBL_CR_POWERON is 0x46480020, 0x0
Nov 20 10:22:01 cristal kernel: speedstep-lib: Coppermine:
MSR_IA32_PLATFORM ID is 0x0, 0x4b560000
Nov 20 10:22:01 cristal kernel: speedstep-smi: signature:0x47534943,
command:0x008000b2, event:0x000000b3, perf_level:0x07d00001.
Nov 20 10:22:01 cristal kernel: cpufreq-core: trying to register
driver speedstep-smi
Nov 20 10:22:01 cristal kernel: cpufreq-core: adding CPU 0
Nov 20 10:22:01 cristal kernel: speedstep-smi: trying to obtain
ownership with command 47534982 at port b1
Nov 20 10:22:01 cristal kernel: speedstep-smi: result is 0
Nov 20 10:22:01 cristal kernel: speedstep-smi: trying to determine
frequencies with command 47534982 at port b1
Nov 20 10:22:01 cristal kernel: speedstep-smi: result 47534982,
low_freq 0, high_freq 4
Nov 20 10:22:01 cristal kernel: speedstep-smi: could not detect low
and high frequencies by SMI call.
Nov 20 10:22:01 cristal kernel: speedstep-lib: trying to determine both spe=
eds
Nov 20 10:22:01 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 20 10:22:01 cristal kernel: speedstep-lib: speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-lib: previous speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-smi: trying to set frequency
to state 1 with command 47534982 at port b1
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 1, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 2, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 3, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 4, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 5, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 20 10:22:01 cristal kernel: speedstep-lib: speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-lib: low speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-smi: trying to set frequency
to state 0 with command 47534982 at port b1
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 1, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 2, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 3, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 4, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-smi: retry 5, previous
result 0, waiting...
Nov 20 10:22:01 cristal kernel: speedstep-lib: P3 -
MSR_IA32_EBL_CR_POWERON: 0x46480020 0x0
Nov 20 10:22:01 cristal kernel: speedstep-lib: speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-lib: high speed is 700000
Nov 20 10:22:01 cristal kernel: speedstep-smi: could not detect two
different speeds -- aborting.
Nov 20 10:22:01 cristal kernel: cpufreq-core: initialization failed
Nov 20 10:22:01 cristal kernel: cpufreq-core: no CPU initialized for
driver speedstep-smi
Nov 20 10:22:01 cristal kernel: cpufreq-core: unregistering CPU 0


> Please ask, if some information is missing.
I think the modules need some option when I load it. I try to seek
this in the Documentation of kernel, but I don't find it.
When I load the modules it don't find the other information of frequency...=
.

>
> Good luck,
I need :-)
>
> bye
bye and thank you very much
Luca
