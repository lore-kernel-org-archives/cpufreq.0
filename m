From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] xen/acpi-processor: C and P-state driver that uploads
 said data to hypervisor.
Date: Mon, 12 Mar 2012 23:35:41 -0400
Message-ID: <20120313033541.GB17536@phenom.dumpdata.com>
References: <1331395500-28033-1-git-send-email-konrad.wilk@oracle.com>
 <1331395500-28033-2-git-send-email-konrad.wilk@oracle.com>
 <4F5DE5AD02000078000779CC@nat28.tlf.novell.com>
 <20120312150729.GB4236@phenom.dumpdata.com>
 <4F5E23CA0200007800077B90@nat28.tlf.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F5E23CA0200007800077B90@nat28.tlf.novell.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Beulich <JBeulich@suse.com>
Cc: mike.mcclurg@citrix.com, ke.yu@intel.com, kevin.tian@intel.com, xen-devel@lists.xensource.com, davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

> >> > +	register_hotcpu_notifier(&xen_cpu_notifier);
> >>=20
> >> This is pointless - you'd get notified of vCPU-s arrival/departure=
 only.
> >> Without pCPU hotplug code in place, there's just nothing you can (=
and
> >> need to) do here.
> >=20
> > I hadn't actually looked in details on the pCPU hotplug code to see=
 how it=20
> > works.
> >=20
> > I presume I need special hardware for this to work as well as the A=
CPI
> > is involved in triggering the hotplug CPU up calls?
>=20
> For exercising the ACPI code paths - yes, you'll need suitable
> hardware. But for just exercising the notifier logic, as said above,
> you don't.

I think I can do the pCPU hotplug code later - as the driver to do the =
hypercall
is not yet in upstream. The TODO after this is to rework the powernow-k=
8.h to
not cause compile warnings.

So, per your suggestions I've reworked the driver some more. Please
see attached.

=46rom ac14b2f77270f3d2c771de71f4a34d06064b1375 Mon Sep 17 00:00:00 200=
1
=46rom: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 3 Feb 2012 16:03:20 -0500
Subject: [PATCH] xen/acpi-processor: C and P-state driver that uploads =
said
 data to hypervisor.
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This driver solves three problems:
 1). Parse and upload ACPI0007 (or PROCESSOR_TYPE) information to the
     hypervisor - aka P-states (cpufreq data).
 2). Upload the the Cx state information (cpuidle data).
 3). Inhibit CPU frequency scaling drivers from loading.

The reason for wanting to solve 1) and 2) is such that the Xen hypervis=
or
is the only one that knows the CPU usage of different guests and can
make the proper decision of when to put CPUs and packages in proper sta=
tes.
Unfortunately the hypervisor has no support to parse ACPI DSDT tables, =
hence it
needs help from the initial domain to provide this information. The rea=
son
for 3) is that we do not want the initial domain to change P-states whi=
le the
hypervisor is doing it as well - it causes rather some funny cases of P=
-states
transitions.

=46or this to work, the driver parses the Power Management data and upl=
oads said
information to the Xen hypervisor. It also calls acpi_processor_notify_=
smm()
to inhibit the other CPU frequency scaling drivers from being loaded.

Everything revolves around the 'struct acpi_processor' structure which
gets updated during the bootup cycle in different stages. At the startu=
p, when
the ACPI parser starts, the C-state information is processed (processor=
_idle)
and saved in said structure as 'power' element. Later on, the CPU frequ=
ency
scaling driver (powernow-k8 or acpi_cpufreq), would call the the
acpi_processor_* (processor_perflib functions) to parse P-states inform=
ation
and populate in the said structure the 'performance' element.

Since we do not want the CPU frequency scaling drivers from loading
we have to call the acpi_processor_* functions to parse the P-states an=
d
call "acpi_processor_notify_smm" to stop them from loading.

There is also one oddity in this driver which is that under Xen, the
physical online CPU count can be different from the virtual online CPU =
count.
Meaning that the macros 'for_[online|possible]_cpu' would process only
up to virtual online CPU count. We on the other hand want to process
the full amount of physical CPUs. For that, the driver checks if the AC=
PI IDs
count is different from the APIC ID count - which can happen if the use=
r
choose to use dom0_max_vcpu argument. In such a case a backup of the PM
structure is used and uploaded to the hypervisor.

[v1-v2: Initial RFC implementations that were posted]
[v3: Changed the name to passthru suggested by Pasi K=E4rkk=E4inen <pas=
ik@iki.fi>]
[v4: Added vCPU !=3D pCPU support - aka dom0_max_vcpus support]
[v5: Cleaned up the driver, fix bug under Athlon XP]
[v6: Changed the driver to a CPU frequency governor]
[v7: Jan Beulich <jbeulich@suse.com> suggestion to make it a cpufreq sc=
aling driver
     made me rework it as driver that inhibits cpufreq scaling driver]
[v8: Per Jan's review comments, fixed up the driver]
Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/xen/Kconfig              |   17 ++
 drivers/xen/Makefile             |    2 +-
 drivers/xen/xen-acpi-processor.c |  565 ++++++++++++++++++++++++++++++=
++++++++
 include/xen/interface/platform.h |   17 ++
 4 files changed, 600 insertions(+), 1 deletions(-)
 create mode 100644 drivers/xen/xen-acpi-processor.c

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index a1ced52..648bcd4 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -178,4 +178,21 @@ config XEN_PRIVCMD
 	depends on XEN
 	default m
=20
+config XEN_ACPI_PROCESSOR
+	tristate "Xen ACPI processor"
+	depends on XEN && X86 && ACPI_PROCESSOR
+	default y if (X86_ACPI_CPUFREQ =3D y || X86_POWERNOW_K8 =3D y)
+	default m if (X86_ACPI_CPUFREQ =3D m || X86_POWERNOW_K8 =3D m)
+	help
+          This ACPI processor uploads Power Management information to =
the Xen hypervisor.
+
+	  To do that the driver parses the Power Management data and uploads =
said
+	  information to the Xen hypervisor. Then the Xen hypervisor can sele=
ct the
+          proper Cx and Pxx states. It also registers itslef as the SM=
M so that
+          other drivers (such as ACPI cpufreq scaling driver) will not=
 load.
+
+          To compile this driver as a module, choose M here: the
+          module will be called xen_acpi_processor  If you do not know=
 what to choose,
+          select M here. If the CPUFREQ drivers are built in, select Y=
 here.
+
 endmenu
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index aa31337..9adc5be 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_SWIOTLB_XEN)		+=3D swiotlb-xen.o
 obj-$(CONFIG_XEN_DOM0)			+=3D pci.o
 obj-$(CONFIG_XEN_PCIDEV_BACKEND)	+=3D xen-pciback/
 obj-$(CONFIG_XEN_PRIVCMD)		+=3D xen-privcmd.o
-
+obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+=3D xen-acpi-processor.o
 xen-evtchn-y				:=3D evtchn.o
 xen-gntdev-y				:=3D gntdev.o
 xen-gntalloc-y				:=3D gntalloc.o
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-pr=
ocessor.c
new file mode 100644
index 0000000..fd49aab
--- /dev/null
+++ b/drivers/xen/xen-acpi-processor.c
@@ -0,0 +1,565 @@
+/*
+ * Copyright 2012 by Oracle Inc
+ * Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+ *
+ * This code borrows ideas from https://lkml.org/lkml/2011/11/30/249
+ * so many thanks go to Kevin Tian <kevin.tian@intel.com>
+ * and Yu Ke <ke.yu@intel.com>.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITH=
OUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
+ * more details.
+ *
+ */
+
+#include <linux/cpumask.h>
+#include <linux/cpufreq.h>
+#include <linux/freezer.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+#include <acpi/processor.h>
+
+#include <xen/interface/platform.h>
+#include <asm/xen/hypercall.h>
+
+#define DRV_NAME "xen-acpi-processor: "
+
+static int no_hypercall;
+MODULE_PARM_DESC(off, "Inhibit the hypercall.");
+module_param_named(off, no_hypercall, int, 0400);
+
+/*
+ * Mutex to protect the acpi_ids_done.
+ */
+static DEFINE_MUTEX(acpi_ids_mutex);
+/*
+ * Note: Do not convert the acpi_id* below to cpumask_var_t or use cpu=
mask_bit
+ * - as those shrink to nr_cpu_bits (which is dependent on possible_cp=
u), which
+ * can be less than what we want to put in. Instead use the 'nr_acpi_b=
its'
+ * which is dynamically computed based on the MADT or x2APIC table.
+ */
+static unsigned int nr_acpi_bits;
+/* Which ACPI ID we have processed from 'struct acpi_processor'. */
+static unsigned long *acpi_ids_done;
+/* Which ACPI ID exist in the SSDT/DSDT processor definitions. */
+static unsigned long __initdata *acpi_id_present;
+/* And if there is an _CST definition (or a PBLK) for the ACPI IDs */
+static unsigned long __initdata *acpi_id_cst_present;
+
+static int push_cxx_to_hypervisor(struct acpi_processor *_pr)
+{
+	struct xen_platform_op op =3D {
+		.cmd			=3D XENPF_set_processor_pminfo,
+		.interface_version	=3D XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id	=3D _pr->acpi_id,
+		.u.set_pminfo.type	=3D XEN_PM_CX,
+	};
+	struct xen_processor_cx *dst_cx, *dst_cx_states =3D NULL;
+	struct acpi_processor_cx *cx;
+	unsigned int i, ok;
+	int ret =3D 0;
+
+	dst_cx_states =3D kcalloc(_pr->power.count,
+				sizeof(struct xen_processor_cx), GFP_KERNEL);
+	if (!dst_cx_states)
+		return -ENOMEM;
+
+	for (ok =3D 0, i =3D 1; i <=3D _pr->power.count; i++) {
+		cx =3D &_pr->power.states[i];
+		if (!cx->valid)
+			continue;
+
+		dst_cx =3D &(dst_cx_states[ok++]);
+
+		dst_cx->reg.space_id =3D ACPI_ADR_SPACE_SYSTEM_IO;
+		if (cx->entry_method =3D=3D ACPI_CSTATE_SYSTEMIO) {
+			dst_cx->reg.bit_width =3D 8;
+			dst_cx->reg.bit_offset =3D 0;
+			dst_cx->reg.access_size =3D 1;
+		} else {
+			dst_cx->reg.space_id =3D ACPI_ADR_SPACE_FIXED_HARDWARE;
+			if (cx->entry_method =3D=3D ACPI_CSTATE_FFH) {
+				/* NATIVE_CSTATE_BEYOND_HALT */
+				dst_cx->reg.bit_offset =3D 2;
+				dst_cx->reg.bit_width =3D 1; /* VENDOR_INTEL */
+			}
+			dst_cx->reg.access_size =3D 0;
+		}
+		dst_cx->reg.address =3D cx->address;
+
+		dst_cx->type =3D cx->type;
+		dst_cx->latency =3D cx->latency;
+		dst_cx->power =3D cx->power;
+
+		dst_cx->dpcnt =3D 0;
+		set_xen_guest_handle(dst_cx->dp, NULL);
+	}
+	if (!ok) {
+		pr_err(DRV_NAME "No _Cx for ACPI CPU %u\n", _pr->acpi_id);
+		kfree(dst_cx_states);
+		return -EINVAL;
+	}
+	op.u.set_pminfo.power.count =3D ok;
+	op.u.set_pminfo.power.flags.bm_control =3D _pr->flags.bm_control;
+	op.u.set_pminfo.power.flags.bm_check =3D _pr->flags.bm_check;
+	op.u.set_pminfo.power.flags.has_cst =3D _pr->flags.has_cst;
+	op.u.set_pminfo.power.flags.power_setup_done =3D
+		_pr->flags.power_setup_done;
+
+	set_xen_guest_handle(op.u.set_pminfo.power.states, dst_cx_states);
+
+	if (!no_hypercall)
+		ret =3D HYPERVISOR_dom0_op(&op);
+
+	if (!ret) {
+		pr_debug("ACPI CPU%u - C-states uploaded.\n", _pr->acpi_id);
+		for (i =3D 1; i <=3D _pr->power.count; i++) {
+			cx =3D &_pr->power.states[i];
+			if (!cx->valid)
+				continue;
+			pr_debug("     C%d: %s %d uS\n",
+				 cx->type, cx->desc, (u32)cx->latency);
+		}
+	} else
+		pr_err(DRV_NAME "(CX): Hypervisor error (%d) for ACPI CPU%u\n",
+		       ret, _pr->acpi_id);
+
+	kfree(dst_cx_states);
+
+	return ret;
+}
+static struct xen_processor_px *
+xen_copy_pss_data(struct acpi_processor *_pr,
+		  struct xen_processor_performance *dst_perf)
+{
+	struct xen_processor_px *dst_states =3D NULL;
+	unsigned int i;
+
+	BUILD_BUG_ON(sizeof(struct xen_processor_px) !=3D
+		     sizeof(struct acpi_processor_px));
+
+	dst_states =3D kcalloc(_pr->performance->state_count,
+			     sizeof(struct xen_processor_px), GFP_KERNEL);
+	if (!dst_states)
+		return ERR_PTR(-ENOMEM);
+
+	dst_perf->state_count =3D _pr->performance->state_count;
+	for (i =3D 0; i < _pr->performance->state_count; i++) {
+		/* Fortunatly for us, they are both the same size */
+		memcpy(&(dst_states[i]), &(_pr->performance->states[i]),
+		       sizeof(struct acpi_processor_px));
+	}
+	return dst_states;
+}
+static int xen_copy_psd_data(struct acpi_processor *_pr,
+			     struct xen_processor_performance *dst)
+{
+	struct acpi_psd_package *pdomain;
+
+	BUILD_BUG_ON(sizeof(struct xen_psd_package) !=3D
+		     sizeof(struct acpi_psd_package));
+
+	/* This information is enumerated only if acpi_processor_preregister_=
performance
+	 * has been called.
+	 */
+	dst->shared_type =3D _pr->performance->shared_type;
+
+	pdomain =3D &(_pr->performance->domain_info);
+
+	/* 'acpi_processor_preregister_performance' does not parse if the
+	 * num_processors <=3D 1, but Xen still requires it. Do it manually h=
ere.
+	 */
+	if (pdomain->num_processors <=3D 1) {
+		if (pdomain->coord_type =3D=3D DOMAIN_COORD_TYPE_SW_ALL)
+			dst->shared_type =3D CPUFREQ_SHARED_TYPE_ALL;
+		else if (pdomain->coord_type =3D=3D DOMAIN_COORD_TYPE_HW_ALL)
+			dst->shared_type =3D CPUFREQ_SHARED_TYPE_HW;
+		else if (pdomain->coord_type =3D=3D DOMAIN_COORD_TYPE_SW_ANY)
+			dst->shared_type =3D CPUFREQ_SHARED_TYPE_ANY;
+
+	}
+	memcpy(&(dst->domain_info), pdomain, sizeof(struct acpi_psd_package))=
;
+	return 0;
+}
+static int xen_copy_pct_data(struct acpi_pct_register *pct,
+			     struct xen_pct_register *dst_pct)
+{
+	/* It would be nice if you could just do 'memcpy(pct, dst_pct') but
+	 * sadly the Xen structure did not have the proper padding so the
+	 * descriptor field takes two (dst_pct) bytes instead of one (pct).
+	 */
+	dst_pct->descriptor =3D pct->descriptor;
+	dst_pct->length =3D pct->length;
+	dst_pct->space_id =3D pct->space_id;
+	dst_pct->bit_width =3D pct->bit_width;
+	dst_pct->bit_offset =3D pct->bit_offset;
+	dst_pct->reserved =3D pct->reserved;
+	dst_pct->address =3D pct->address;
+	return 0;
+}
+static int push_pxx_to_hypervisor(struct acpi_processor *_pr)
+{
+	int ret =3D 0;
+	struct xen_platform_op op =3D {
+		.cmd			=3D XENPF_set_processor_pminfo,
+		.interface_version	=3D XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id	=3D _pr->acpi_id,
+		.u.set_pminfo.type	=3D XEN_PM_PX,
+	};
+	struct xen_processor_performance *dst_perf;
+	struct xen_processor_px *dst_states =3D NULL;
+
+	dst_perf =3D &op.u.set_pminfo.perf;
+
+	dst_perf->platform_limit =3D _pr->performance_platform_limit;
+	dst_perf->flags |=3D XEN_PX_PPC;
+	xen_copy_pct_data(&(_pr->performance->control_register),
+			  &dst_perf->control_register);
+	xen_copy_pct_data(&(_pr->performance->status_register),
+			  &dst_perf->status_register);
+	dst_perf->flags |=3D XEN_PX_PCT;
+	dst_states =3D xen_copy_pss_data(_pr, dst_perf);
+	if (!IS_ERR_OR_NULL(dst_states)) {
+		set_xen_guest_handle(dst_perf->states, dst_states);
+		dst_perf->flags |=3D XEN_PX_PSS;
+	}
+	if (!xen_copy_psd_data(_pr, dst_perf))
+		dst_perf->flags |=3D XEN_PX_PSD;
+
+	if (dst_perf->flags !=3D (XEN_PX_PSD | XEN_PX_PSS | XEN_PX_PCT | XEN_=
PX_PPC)) {
+		pr_warn(DRV_NAME "ACPI CPU%u missing some P-state data (%x), skippin=
g.\n",
+			_pr->acpi_id, dst_perf->flags);
+		ret =3D -ENODEV;
+		goto err_free;
+	}
+
+	if (!no_hypercall)
+		ret =3D HYPERVISOR_dom0_op(&op);
+
+	if (!ret) {
+		struct acpi_processor_performance *perf;
+		unsigned int i;
+
+		perf =3D _pr->performance;
+		pr_debug("ACPI CPU%u - P-states uploaded.\n", _pr->acpi_id);
+		for (i =3D 0; i < perf->state_count; i++) {
+			pr_debug("     %cP%d: %d MHz, %d mW, %d uS\n",
+			(i =3D=3D perf->state ? '*' : ' '), i,
+			(u32) perf->states[i].core_frequency,
+			(u32) perf->states[i].power,
+			(u32) perf->states[i].transition_latency);
+		}
+	} else if (ret !=3D -EINVAL)
+		/* EINVAL means the ACPI ID is incorrect - meaning the ACPI
+		 * table is referencing a non-existing CPU - which can happen
+		 * with broken ACPI tables. */
+		pr_warn(DRV_NAME "(_PXX): Hypervisor error (%d) for ACPI CPU%u\n",
+		       ret, _pr->acpi_id);
+err_free:
+	if (!IS_ERR_OR_NULL(dst_states))
+		kfree(dst_states);
+
+	return ret;
+}
+static int upload_pm_data(struct acpi_processor *_pr)
+{
+	int err =3D 0;
+
+	mutex_lock(&acpi_ids_mutex);
+	if (__test_and_set_bit(_pr->acpi_id, acpi_ids_done)) {
+		mutex_unlock(&acpi_ids_mutex);
+		return -EBUSY;
+	}
+	if (_pr->flags.power)
+		err =3D push_cxx_to_hypervisor(_pr);
+
+	if (_pr->performance && _pr->performance->states)
+		err |=3D push_pxx_to_hypervisor(_pr);
+
+	mutex_unlock(&acpi_ids_mutex);
+	return err;
+}
+static unsigned int __init get_max_acpi_id(void)
+{
+	struct xenpf_pcpuinfo *info;
+	struct xen_platform_op op =3D {
+		.cmd =3D XENPF_get_cpuinfo,
+		.interface_version =3D XENPF_INTERFACE_VERSION,
+	};
+	int ret =3D 0;
+	unsigned int i, max_apic_id, max_acpi_id =3D 0;
+
+	info =3D &op.u.pcpu_info;
+	info->xen_cpuid =3D 0;
+
+	ret =3D HYPERVISOR_dom0_op(&op);
+	if (ret)
+		return max_acpi_id;
+
+	/* The max_present is the same irregardless of the xen_cpuid */
+	max_apic_id =3D op.u.pcpu_info.max_present;
+	for (i =3D 0; i <=3D max_apic_id; i++) {
+		info->xen_cpuid =3D i;
+		ret =3D HYPERVISOR_dom0_op(&op);
+		if (ret)
+			continue;
+		max_acpi_id =3D max(info->acpi_id, max_acpi_id);
+	}
+	pr_debug(DRV_NAME "Max ACPI ID: %u\n", max_acpi_id);
+	return max_acpi_id;
+}
+/*
+ * The read_acpi_id and check_acpi_ids are there to support the Xen
+ * oddity of virtual CPUs !=3D physical CPUs in the initial domain.
+ * The user can supply 'xen_max_vcpus=3DX' on the Xen hypervisor line
+ * which will band the amount of CPUs the initial domain can see.
+ * In general that is OK, except it plays havoc with any of the
+ * for_each_[present|online]_cpu macros which are banded to the virtua=
l
+ * CPU amount.
+ */
+static acpi_status __init
+read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
+{
+	u32 acpi_id;
+	acpi_status status;
+	acpi_object_type acpi_type;
+	unsigned long long tmp;
+	union acpi_object object =3D { 0 };
+	struct acpi_buffer buffer =3D { sizeof(union acpi_object), &object };
+	acpi_io_address pblk =3D 0;
+
+	status =3D acpi_get_type(handle, &acpi_type);
+	if (ACPI_FAILURE(status))
+		return AE_OK;
+
+	switch (acpi_type) {
+	case ACPI_TYPE_PROCESSOR:
+		status =3D acpi_evaluate_object(handle, NULL, NULL, &buffer);
+		if (ACPI_FAILURE(status))
+			return AE_OK;
+		acpi_id =3D object.processor.proc_id;
+		pblk =3D object.processor.pblk_address;
+		break;
+	case ACPI_TYPE_DEVICE:
+		status =3D acpi_evaluate_integer(handle, "_UID", NULL, &tmp);
+		if (ACPI_FAILURE(status))
+			return AE_OK;
+		acpi_id =3D tmp;
+		break;
+	default:
+		return AE_OK;
+	}
+	/* There are more ACPI Processor objects than in x2APIC or MADT.
+	 * This can happen with incorrect ACPI SSDT declerations. */
+	if (acpi_id > nr_acpi_bits) {
+		pr_debug(DRV_NAME "We only have %u, trying to set %u\n",
+			 nr_acpi_bits, acpi_id);
+		return AE_OK;
+	}
+	/* OK, There is a ACPI Processor object */
+	__set_bit(acpi_id, acpi_id_present);
+
+	pr_debug(DRV_NAME "ACPI CPU%u w/ PBLK:0x%lx\n", acpi_id,
+		 (unsigned long)pblk);
+
+	status =3D acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		if (!pblk)
+			return AE_OK;
+	}
+	/* .. and it has a C-state */
+	__set_bit(acpi_id, acpi_id_cst_present);
+
+	return AE_OK;
+}
+static int __init check_acpi_ids(struct acpi_processor *pr_backup)
+{
+
+	if (!pr_backup)
+		return -ENODEV;
+
+	/* All online CPUs have been processed at this stage. Now verify
+	 * whether in fact "online CPUs" =3D=3D physical CPUs.
+	 */
+	acpi_id_present =3D kcalloc(BITS_TO_LONGS(nr_acpi_bits), sizeof(unsig=
ned long), GFP_KERNEL);
+	if (!acpi_id_present)
+		return -ENOMEM;
+
+	acpi_id_cst_present =3D kcalloc(BITS_TO_LONGS(nr_acpi_bits), sizeof(u=
nsigned long), GFP_KERNEL);
+	if (!acpi_id_cst_present) {
+		kfree(acpi_id_present);
+		return -ENOMEM;
+	}
+
+	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
+			    ACPI_UINT32_MAX,
+			    read_acpi_id, NULL, NULL, NULL);
+	acpi_get_devices("ACPI0007", read_acpi_id, NULL, NULL);
+
+	if (!bitmap_equal(acpi_id_present, acpi_ids_done, nr_acpi_bits)) {
+		unsigned int i;
+		for_each_set_bit(i, acpi_id_present, nr_acpi_bits) {
+			pr_backup->acpi_id =3D i;
+			/* Mask out C-states if there are no _CST or PBLK */
+			pr_backup->flags.power =3D test_bit(i, acpi_id_cst_present);
+			(void)upload_pm_data(pr_backup);
+		}
+	}
+	kfree(acpi_id_present);
+	acpi_id_present =3D NULL;
+	kfree(acpi_id_cst_present);
+	acpi_id_cst_present =3D NULL;
+	return 0;
+}
+static int __init check_prereq(void)
+{
+	struct cpuinfo_x86 *c =3D &cpu_data(0);
+
+	if (!xen_initial_domain())
+		return -ENODEV;
+
+	if (!acpi_gbl_FADT.smi_command)
+		return -ENODEV;
+
+	if (c->x86_vendor =3D=3D X86_VENDOR_INTEL) {
+		if (!cpu_has(c, X86_FEATURE_EST))
+			return -ENODEV;
+
+		return 0;
+	}
+	if (c->x86_vendor =3D=3D X86_VENDOR_AMD) {
+		/* Copied from powernow-k8.h, can't include ../cpufreq/powernow
+		 * as we get compile warnings for the static functions.
+		 */
+#define CPUID_FREQ_VOLT_CAPABILITIES    0x80000007
+#define USE_HW_PSTATE                   0x00000080
+		u32 eax, ebx, ecx, edx;
+		cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
+		if ((edx & USE_HW_PSTATE) !=3D USE_HW_PSTATE)
+			return -ENODEV;
+		return 0;
+	}
+	return -ENODEV;
+}
+/* acpi_perf_data is a pointer to percpu data. */
+static struct acpi_processor_performance __percpu *acpi_perf_data;
+
+static void free_acpi_perf_data(void)
+{
+	unsigned int i;
+
+	/* Freeing a NULL pointer is OK, and alloc_percpu zeroes. */
+	for_each_possible_cpu(i)
+		free_cpumask_var(per_cpu_ptr(acpi_perf_data, i)
+				 ->shared_cpu_map);
+	free_percpu(acpi_perf_data);
+}
+
+static int __init xen_acpi_processor_init(void)
+{
+	struct acpi_processor *pr_backup =3D NULL;
+	unsigned int i;
+	int rc =3D check_prereq();
+
+	if (rc)
+		return rc;
+
+	nr_acpi_bits =3D get_max_acpi_id() + 1;
+	acpi_ids_done =3D kcalloc(BITS_TO_LONGS(nr_acpi_bits), sizeof(unsigne=
d long), GFP_KERNEL);
+	if (!acpi_ids_done)
+		return -ENOMEM;
+
+	acpi_perf_data =3D alloc_percpu(struct acpi_processor_performance);
+	if (!acpi_perf_data) {
+		pr_debug(DRV_NAME "Memory allocation error for acpi_perf_data.\n");
+		kfree(acpi_ids_done);
+		return -ENOMEM;
+	}
+	for_each_possible_cpu(i) {
+		if (!zalloc_cpumask_var_node(
+			&per_cpu_ptr(acpi_perf_data, i)->shared_cpu_map,
+			GFP_KERNEL, cpu_to_node(i))) {
+			rc =3D -ENOMEM;
+			goto err_out;
+		}
+	}
+
+	/* Do initialization in ACPI core */
+	rc =3D acpi_processor_preregister_performance(acpi_perf_data);
+	if (WARN_ON(rc))
+		goto err_out;
+
+	for_each_possible_cpu(i) {
+		struct acpi_processor_performance *perf;
+
+		perf =3D per_cpu_ptr(acpi_perf_data, i);
+		rc =3D acpi_processor_register_performance(perf, i);
+		if (WARN_ON(rc))
+			goto err_out;
+	}
+	rc =3D acpi_processor_notify_smm(THIS_MODULE);
+	if (WARN_ON(rc))
+		goto err_unregister;
+
+	for_each_possible_cpu(i) {
+		struct acpi_processor *_pr;
+		_pr =3D per_cpu(processors, i /* APIC ID */);
+		if (!_pr)
+			continue;
+
+		if (!pr_backup) {
+			pr_backup =3D kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
+			memcpy(pr_backup, _pr, sizeof(struct acpi_processor));
+		}
+		(void)upload_pm_data(_pr);
+	}
+	rc =3D check_acpi_ids(pr_backup);
+	if (rc)
+		goto err_unregister;
+
+	kfree(pr_backup);
+
+	return 0;
+err_unregister:
+	for_each_possible_cpu(i) {
+		struct acpi_processor_performance *perf;
+		perf =3D per_cpu_ptr(acpi_perf_data, i);
+		acpi_processor_unregister_performance(perf, i);
+	}
+err_out:
+	/* Freeing a NULL pointer is OK: alloc_percpu zeroes. */
+	free_acpi_perf_data();
+	kfree(acpi_ids_done);
+	return rc;
+}
+static void __exit xen_acpi_processor_exit(void)
+{
+	int i;
+
+	kfree(acpi_ids_done);
+	for_each_possible_cpu(i) {
+		struct acpi_processor_performance *perf;
+		perf =3D per_cpu_ptr(acpi_perf_data, i);
+		acpi_processor_unregister_performance(perf, i);
+	}
+	free_acpi_perf_data();
+}
+
+MODULE_AUTHOR("Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>");
+MODULE_DESCRIPTION("Xen ACPI Processor P-states (and Cx) driver which =
uploads PM data to Xen hypervisor");
+MODULE_LICENSE("GPL");
+
+/* We want to be loaded before the CPU freq scaling drivers are loaded=
=2E
+ * They are loaded in late_initcall. */
+device_initcall(xen_acpi_processor_init);
+module_exit(xen_acpi_processor_exit);
diff --git a/include/xen/interface/platform.h b/include/xen/interface/p=
latform.h
index 861b359b..486653f 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -298,6 +298,22 @@ struct xenpf_set_processor_pminfo {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_set_processor_pminfo);
=20
+#define XENPF_get_cpuinfo 55
+struct xenpf_pcpuinfo {
+	/* IN */
+	uint32_t xen_cpuid;
+	/* OUT */
+	/* The maxium cpu_id that is present */
+	uint32_t max_present;
+#define XEN_PCPU_FLAGS_ONLINE   1
+	/* Correponding xen_cpuid is not present*/
+#define XEN_PCPU_FLAGS_INVALID  2
+	uint32_t flags;
+	uint32_t apic_id;
+	uint32_t acpi_id;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xenpf_pcpuinfo);
+
 struct xen_platform_op {
 	uint32_t cmd;
 	uint32_t interface_version; /* XENPF_INTERFACE_VERSION */
@@ -313,6 +329,7 @@ struct xen_platform_op {
 		struct xenpf_change_freq       change_freq;
 		struct xenpf_getidletime       getidletime;
 		struct xenpf_set_processor_pminfo set_pminfo;
+		struct xenpf_pcpuinfo          pcpu_info;
 		uint8_t                        pad[128];
 	} u;
 };
--=20
1.7.7.5

