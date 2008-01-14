From: Thomas Renninger <trenn@suse.de>
Subject: Re: Overall picture of cpufreq..
Date: Mon, 14 Jan 2008 11:32:48 +0100
Message-ID: <1200306768.23376.332.camel@queen.suse.de>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
	<1200264884.4157.16.camel@queen>
	<9f79f7f50801131812x6a68c202tb4c25fa2116b32e4@mail.gmail.com>
	<478B0A82.6050503@wpkg.org> <1200304310.23376.311.camel@queen.suse.de>
	<478B3695.1030406@wpkg.org>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <478B3695.1030406@wpkg.org>
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
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: Martin.Leisner@xerox.com, cpufreq@lists.linux.org.uk

On Mon, 2008-01-14 at 11:16 +0100, Tomasz Chmielewski wrote:
> Thomas Renninger schrieb:
> > On Mon, 2008-01-14 at 08:08 +0100, Tomasz Chmielewski wrote:
> 
> (...)
> 
> >> It looks to me that ondemand governor doesn't have "the complete 
> >> intelligence".
> >>
> >> For example, it doesn't detect CPU load coming from some kernel tasks, 
> >> like kcryptd: reads/writes from a device crypted with dm-crypt will be 
> >> very slow if one uses the ondemand governor, as CPU speed will always be 
> >> set to the lowest possible (so there is not enough power to 
> >> crypt/decrypt data).
> >>
> >> Ironically, this is the only case when starting bzip2 will speed up your 
> >> disk access... Or, use a userspace governor.
> >>
> >>
> >> See also http://bugzilla.kernel.org/show_bug.cgi?id=9729
> > 
> > I don't know about this one.
> > AFAIK there has been some work done there, I expect the bug in the
> > crypto area, not in cpufreq/ondemand layer.
> > 
> > A Xeon processor stepped down from 2800 to 350 looks bogus (maybe the
> > new ones even can, not sure)
> 
> Quite the contrary - it's a pretty old Xeon which is i386 only.
> Why does it look bogus to you, anyway?
> 
> 
> > could it be that you are using
> > p4-clockmode driver which is doing throttling, not frequency scaling,
> > better try with acpi-cpufreq then.
> 
> Indeed, I am using p4-clockmod.
Sorry, but your bug report is invalid then.
p4-clockmod is using throttling (means the CPU ignores cycles/ticks) and
not CPU frequency/voltage reduction.
There is another interface for that:
/proc/acpi/processor/throttling
(AFAIK there exists a brandnew sys interface also)
If you have a userspace app making use of that you "double throttle"
which can lead to very bad performance behavior.

> acpi-cpufreq doesn't work for me on that machine (p4-clockmod not loaded 
> when I try to insert acpi-cpufreq):
> 
> # modprobe acpi-cpufreq
> FATAL: Error inserting acpi_cpufreq 
> (/lib/modules/2.6.23.12-pata-1/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
> No such device

Have you checked whether that the CPU is cpufreq capable at all?
If yes, you might want to upgrade the BIOS.

Still, it looks strange that frequency (in this case throttling) is not
set to the highest state as measuring the idle time should be the same
mechanism and low-level driver independent. So this may be a valid bug,
but using p4-clockmode is not a good idea to work on it (p4-clockmode is
not a good idea to work on in general, IMO it should vanish totally...).

  Thomas
