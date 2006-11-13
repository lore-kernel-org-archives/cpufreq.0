From: Stephan Springl <springl-cpufreq@bfw-online.de>
Subject: Patch: Remove documentation for tunable sampling_down_factor
Date: Mon, 13 Nov 2006 13:14:47 +0100 (MEZ)
Message-ID: <Pine.LNX.4.62.0611131313010.27387@lar.bfw.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-555875106-376338296-1163420087=:27387"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---555875106-376338296-1163420087=:27387
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

a leftover in the docs ...

Stephan


commit e0bed1e86d4e556266421789077e8064ce9e1fdb
Author: Stephan Springl <springl-cpufreq@bfw-online.de>
Date:   Mon Nov 13 10:26:10 2006 +0100

     [CPUFREQ] Remove documentation for tunable sampling_down_factor in ond=
emand

     Remove documentation for tunable sampling_down_factor in ondemand gove=
rnor.
     Commit ccb2fe209dac9ff67f6351e783e610073afaaeaf removed the tunable bu=
t did
     not remove the documentation for it.

diff --git a/Documentation/cpu-freq/governors.txt b/Documentation/cpu-freq/=
governors.txt
index 6a9c55b..dcec056 100644
--- a/Documentation/cpu-freq/governors.txt
+++ b/Documentation/cpu-freq/governors.txt
@@ -129,14 +129,6 @@ to its default value of '80' it means th
  intervals the CPU needs to be on average more than 80% in use to then
  decide that the CPU frequency needs to be increased.

-sampling_down_factor: this parameter controls the rate that the CPU
-makes a decision on when to decrease the frequency.  When set to its
-default value of '5' it means that at 1/5 the sampling_rate the kernel
-makes a decision to lower the frequency.  Five "lower rate" decisions
-have to be made in a row before the CPU frequency is actually lower.
-If set to '1' then the frequency decreases as quickly as it increases,
-if set to '2' it decreases at half the rate of the increase.
-
  ignore_nice_load: this parameter takes a value of '0' or '1'. When
  set to '0' (its default), all processes are counted towards the
  'cpu utilisation' value.  When set to '1', the processes that are

--
Stephan Springl                           BFW Werner V=F6lk GmbH
springl-cpufreq@bfw-online.de             Energiemesstechnik & Service
+49 89 82917-452                          Drosselgasse 5
                                           82166 Gr=E4felfing/M=FCnchen
---555875106-376338296-1163420087=:27387
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

---555875106-376338296-1163420087=:27387--

