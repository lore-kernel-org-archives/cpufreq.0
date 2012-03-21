From: <Thomas.Bartholomae@lantiq.com>
Subject: cpufrequtils-0.3.tar.gz
Date: Wed, 21 Mar 2012 09:34:33 +0000
Message-ID: <CA11D4D291418148B4814B9F023E3E2E0CDF08@MUCSE501.eu.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hi,

I implement already the linux cpufreq kernel driver onto our embedded l=
inux system.
On top of this I wanna install the cpufrequtils in userspace for easy a=
ccess to the sysfs interface of the cpufreq driver.
But if try to create a package out of the cpufrequtils-0.3.tar.gz with =
sysfs support I got a problem that a function from the
necessary libsysfs is missing (sysfs_write_attribute_value).

If I try to patch this I will get a lot of compile issues from the sysf=
sutils package.
My sysfsutils version: sysfsutils-2.1.0

My question is, is there a newer version of the cpufrequtils , or patch=
, available then the one I used which fix this problem.


Thomas Bartholom=E4
e-mail:     thomas.bartholomae@lantiq.com
VISIT US AT: http://www.lantiq.com
-----------------------------------------------------------------------=
-----------------------------------------------------------------------=
-------------
Lantiq Deutschland GmbH
Registered Office: M=FCnchen
Commercial Register: Amtsgericht M=FCnchen, HRB 180524
Managing Directors (Gesch=E4ftsf=FChrer):
Christian Wolff (CEO), Dr. Klaus Gohlke (CFO)
-----------------------------------------------------------------------=
-----------------------------------------------------------------------=
-------------
Important Note: This e-mail may contain trade secrets or privileged, un=
disclosed or otherwise confidential information.
If you have received this e-mail in error, you are hereby notified that=
 any review, copying or distribution of it is strictly prohibited.
Please inform us immediately and destroy the original transmittal. Than=
k you for your cooperation.



