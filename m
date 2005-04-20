From: <ken_staton@agilent.com>
Subject: longhaul test scripts
Date: Wed, 20 Apr 2005 09:32:58 -0700
Message-ID: <3EFE14A8A1A82D4BB867A48A01A88ED708A093@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

longhaul is working.

this message describes my test method.

running these test scripts on the current version of longhaul locks the =
system within seconds.
the patch i sent to the list 11apr2005 would run for days with the same =
test scripts,
***provided that the only source of dma was ide***.
today's patch (mailed to the list separately) takes care of all pci =
masters.


here's how i've tested this:

keep disks busy:
http://people.redhat.com/dledford/memtest.html


repeatedly switch frequencies:

#!/bin/sh
# 30 times per minute
# 1800 times per hour
# run it for 7 days =3D 168 hours

for j in `seq 1 168`;
do
   for i in `seq 1 1800`;
     do

#      echo "down "
       sleep 1
       curspd=3D"`cat =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`"
       newspd=3D$curspd
       echo 532000 > =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	while [ $curspd =3D $newspd ]
	do
	  # wait for speed change
           sleep 1
           newspd=3D"`cat =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`"
	done

#      echo "up "
       sleep 1
       curspd=3D"`cat =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`"
       newspd=3D$curspd
       echo 997000 > =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	while [ $curspd =3D $newspd ]
	do
	  # wait for speed change
           sleep 1
           newspd=3D"`cat =
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`"
	done


     done
done
