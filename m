From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Shell script to select the right cpufreq module?
Date: Wed, 31 Mar 2004 07:34:55 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040331073455.q797owk8kwogcccw@carlthompson.net>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040330203109.GA7141@dominikbrodowski.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>

Does Vendor/Family/Model/Stepping give you enough information to
determine the appropriate cpufreq driver?  I notice that you are also
looking for the acpi processor flag which will override everything else
and using the p4-clockmod driver.  Otherwise, it looks like my Dell
laptop would have used speedstep-ich according to your script.  Is
p4-clockmod better than speedstep-ich?  Is it true that any processor
that has the 'acpi' flag set will use the p4-clockmod driver as your
script assumes?  Fedora Core 2 does not seem to even include the
speedstep-ich driver.  Is it obsolete?  (Sorry, most of my experience
is with AMD mobile processors).

Where can I find more complete info on possible values for the fields of
/proc/cpuinfo and the different cpufreq drivers they represent?  It
doesn't have to be a working script; with the info I'll write my own to
include with cpuspeed.

Thanks,
Carl

Quoting Dominik Brodowski <linux@dominikbrodowski.de>:

> On Tue, Mar 30, 2004 at 09:27:33PM +0200, Michael Opdenacker wrote:
>> Does anyone here already have a shell script that reads 
>> /proc/cpuinfo and returns the name of the corresponding cpufreq 
>> module if the processor is supported?
>>
>> Otherwise, I'll start to write one and ask you guys to test it, as I 
>> can only make tests on P4.
>
> I proposed one such shell script a couple of weeks ago and submitted a
> draft, which I can't locate in the archives ATM so here it is again:
>
> #!/bin/sh
>
> # Copyright (C) 2004 Dominik Brodowski <linux@brodo.de>
> #
> # This script is free software; you can redistribute it and/or modify
> # it under the terms of the GNU General Public License version 2 as
> # published by the Free Software Foundation.
> #
> # This script tries to detect the best suited x86 cpufreq driver, and
> # load it using "modprobe" commands.
> #
> #
>
> DEBUG=1
>
> KV="$(uname -r | cut -c1-3)"
>
> if [ "$KV" != "2.6" ]; then
> 	echo "Wrong kernel version"
> 	exit 1
> fi
>
> # the cpufreq drivers
> ACPI=0
> P4CLOCKMOD=0
> SPEEDSTEP_SMI=0
> SPEEDSTEP_ICH=0
> SPEEDSTEP_CENTRINO=0
> FLAG_EST=0
> FLAG_ACPI=0
> FLAG_ACC=0
>
> # parse /proc/cpuinfo
> FAMILY="$(cat /proc/cpuinfo | grep "cpu family" | cut -c14-)"
> MODEL="$(cat /proc/cpuinfo | grep "model" | grep -v "model name" | 
> cut -c10-)"
> STEPPING="$(cat /proc/cpuinfo | grep "stepping" | cut -c12-)"
>
> # parse for vendor
> cat /proc/cpuinfo | grep vendor_id | grep Intel &> /dev/null && INTEL=1
>
> # parse flags
> cat /proc/cpuinfo | grep "flags" | grep " est" &> /dev/null && FLAG_EST=1
> cat /proc/cpuinfo | grep "flags" | grep " acpi" &> /dev/null && FLAG_ACPI=1
> cat /proc/cpuinfo | grep "flags" | grep " tm" &> /dev/null && FLAG_ACC=1
>
>
> if [ $DEBUG -eq 1 ]; then
> 	echo "CPU family is $FAMILY"
> 	echo "CPU model is $MODEL"
> 	echo "CPU stepping is $STEPPING"
> 	echo "CPU vendor: Intel? $INTEL"
> fi
>
>
> if [ $INTEL -eq 1 ];  then
> 	case "$FAMILY" in
> 		"6")
> 			if [ $DEBUG -eq 1 ]; then
> 				echo "Pentium 3 or Pentium M detected."
> 			fi
> 			case "$MODEL" in
> 				"9")
> 					if [ "$STEPPING" == "5" ] ; then
> 						if [ $FLAG_EST -eq 1 ]; then
> 							SPEEDSTEP_CENTRINO=1
> 						fi
> 					fi
> 					;;
> 				"8")
> 					SPEEDSTEP_SMI=1
> 					SPEEDSTEP_ICH=1
> 					;;
> 				"11")
> 					SPEEDSTEP_ICH=1
> 					;;
> 				*)
> 					echo "Unknown CPU."
> 					;;
> 			esac
> 			;;
> 		"15")
> 			if [ $DEBUG -eq 1 ]; then
> 				echo "Pentium 4 detected."
> 			fi
> 			if [ "$MODEL" == "2" ]; then
> 				case "$STEPPING" in
> 					"4")
> 						SPEEDSTEP_ICH=1
> 						;;
> 					"7")
> 						SPEEDSTEP_ICH=1
> 						;;
> 					"9")
> 						SPEEDSTEP_ICH=1
> 						;;
> 					*)
> 						true
> 						;;
> 				esac
> 			fi
> 			;;
> 		*)
> 			echo "unknown Intel Processor. Aborting."
> 			exit 1
> 			;;
> 	esac
> 	if [ $FLAG_ACPI -eq 1 ]; then
> 		if [ $FLAG_ACC -eq 1 ]; then
> 			P4CLOCKMOD=1;
> 		fi
> 	fi
> 	ACPI=1
> fi
>
> if [ $DEBUG -eq 1 ]; then
> 	echo "ACPI? $ACPI"
> 	echo "P4CLOCKMOD? $P4CLOCKMOD"
> 	echo "SPEEDSTEP_CENTRINO? $SPEEDSTEP_CENTRINO"
> 	echo "SPEEDSTEP_ICH? $SPEEDSTEP_ICH"
> 	echo "SPEEDSTEP_SMI? $SPEEDSTEP_SMI"
> fi
>
> if [ $SPEEDSTEP_CENTRINO -eq 1 ]; then
> 	modprobe speedstep-centrino
> fi
>
> if [ $SPEEDSTEP_ICH -eq 1 ]; then
> 	modprobe speedstep-ich
> fi
>
> if [ $ACPI -eq 1 ]; then
> 	modprobe acpi
> fi
>
> if [ $P4CLOCKMOD -eq 1 ]; then
> 	modprobe p4-clockmod
> fi
>
> if [ $SPEEDSTEP_SMI -eq 1 ]; then
> 	modprobe speedstep-smi
> fi
>
>
>
> end of script... and as I'm more interested in the kernel side of cpufreq
> anyways, I'd be glad if somebody else would finish this script and make it
> ready for prime-time usage. Are you willing to do so? Would be great!
>
> 	Dominik
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
