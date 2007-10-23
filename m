From: "Shriphani Palakodety" <shriphanip@gmail.com>
Subject: enabling cpu-scaling at boot-time
Date: Tue, 23 Oct 2007 20:35:01 +0530
Message-ID: <80f9e6490710230805oe267cccy787f22e3a98c061c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hello all,
I run debian linux on an Acer Travelmate 4500 and CPU scaling is never
initiated when the OS boots because the acpi-cpufreq module is not loaded. I
rectified this by putting a line 'modprobe acpi-cpufreq' in
/etc/init.d/cpufrequtils and now cpu scaling is initiated at boot-time. Hope
this info was of help.

Regards,
Shriphani Palakodety
