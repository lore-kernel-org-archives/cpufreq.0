From: paul.devriendt@amd.com
Subject: RE: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 08:49:18 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C080EF3A4@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: linux@dominikbrodowski.de
Cc: davej@redhat.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux-kernel@vger.kernel.org

>> hardware. Dominik sent me some great patches to use the cpufreq table support 
>> and remove some redundant code - let me know if you do not have them and
>> want me to forward them. They work great.
> 
> I've rediffed them for 2.6.1 and put them here:
> 
> http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_1
> 
> http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_2
> 
> http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_3
> 
> http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_4
> 
> http://www.brodo.de/patches/2004_01_14/powernow-k8-2.6.1-freq_table_5
> 
> Paul: do you agree to them being merged?
> 
> 	Dominik

Absolutely. I am planning on using them also in the new ACPI based driver,
along with your acpi-perflib.

What is your progress on getting acpi-perflib merged into the kernel so that
an additional patch is not needed ?

Paul.
